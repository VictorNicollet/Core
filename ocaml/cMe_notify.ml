(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CMe_common

let  count = 10

let () = define UrlMe.Notify.def_home begin fun cuid  ->   

  let! list, _ = ohm $ O.decay (MNotify.Store.all_mine ~count cuid) in
  let! list = ohm $ O.decay (Run.list_filter begin fun t -> 
    let! author = ohm $ MNotify.Payload.author cuid (t # payload) in
    match author with 
      | Some (`RunOrg iid) -> return (Some (iid, (`RunOrg iid, t)))
      | Some (`Person (aid,iid)) -> return (Some (Some iid, (`Person (aid,iid), t)))
      | None -> let! () = ohm $ MNotify.Store.rotten (t # id) in
		return None
  end list) in

  let by_iid = Ohm.ListAssoc.group_seq list in 

  let! now = ohmctx (#time) in

  let render_item (who,what) = 

    let! pic, name = ohm begin 
      match who with 
	| `RunOrg _ -> return (None, None)
	| `Person (aid,_) -> let! profile = ohm $ CAvatar.mini_profile aid in 
			     return (profile # pico, Some profile # name) 
    end in

    let text, more = match what # payload with 
      | `NewInstance _ -> `NewInstance1, []
      | `NewUser     _ -> `NewUser1, []
      | `NewJoin     _ -> `NewJoin1, []
      | _ -> `Whatever, []
    in

    return (object
      method pic  = pic
      method name = name
      method date = (what # time, now)
      method text = text
      method more = more  
      method seen = what # seen
      method url  = "" 
    end)
  in

  let! list = ohm $ O.decay (Run.list_filter begin fun (iid,items) -> 

    let no_instance = 
      let! () = ohm $ Run.list_iter (snd |- (#id) |- MNotify.Store.rotten) items in
      return None
    in

    let! instance = ohm_req_or (return None)  begin
      match iid with 
	| None -> return $ Some (object
	  method name = "RunOrg"
	  method url  = "http://runorg.com/"
	  method pic  = Some "/public/img/logo-square.png"
	end)
	| Some iid -> 
	  let! instance = ohm_req_or no_instance $ MInstance.get iid in
	  let! pic = ohm $ CPicture.small_opt (instance # pic) in
	  return $ Some (object
	    method name = instance # name
	    method url  = Action.url UrlClient.website (instance # key) ()
	    method pic  = pic
	  end)					      
    end in 

    let! items = ohm $ Run.list_map render_item items in

    return $ Some (object
      method instance = instance
      method items = items
    end)
  end by_iid) in

  O.Box.fill begin
    Asset_Notify_List.render (object
      method list = list
    end)
  end 
end

let () = UrlMe.Notify.def_count begin fun req res -> 

  let respond count = 
    return $ Action.jsonp ?callback:(req # get "callback") (Json.Int count) res 
  in 

  let! cuid = req_or (respond 0) $ CSession.get req in 
  let! count = ohm $ MNotify.Store.count_mine cuid in 

  respond count

end 