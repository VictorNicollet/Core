(* © 2013 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

let () = MItem.Notify.define begin fun uid u t info -> 

  let! access = ohm_req_or (return None) (CAccess.of_notification uid (t # iid)) in
  let! item   = ohm_req_or (return None) (MItem.try_get (access # actor) (t # itid)) in
  let! mail   = req_or (return None) (match item # payload with 
    | `Mail mail -> Some mail
    | `MiniPoll _ 
    | `Image _ 
    | `Doc _ 
    | `Message _ -> None) in

  let key = access # instance # key in 

  let! url, context = ohm_req_or (return None) begin 

    match item # where with 
      | `feed fid -> begin
	let! feed = ohm_req_or (return None) $ MFeed.try_get (access # actor) fid in 
	match MFeed.Get.owner feed with 
	  | `Event eid -> let! event = ohm_req_or (return None) 
			    (MEvent.view ~actor:(access # actor) eid) in 
			  let  url = 
			    Action.url UrlClient.Events.see key [ IEvent.to_string eid ] in
			  let! context = ohm (match MEvent.Get.name event with 
			    | None -> AdLib.get `Event_Unnamed
			    | Some name -> return name) in
			  return $ Some (url, context)
	  | `Discussion did -> let! dscn = ohm_req_or (return None) 
				 (MDiscussion.view ~actor:(access # actor) did) in
			       let  url = 
				 Action.url UrlClient.Discussion.see key [ IDiscussion.to_string did ] in
			       let  context = MDiscussion.Get.title dscn in 
			       return $ Some (url, context) 
      end
      | `album  aid -> return None
      | `folder fid -> return None		

  end in
					    
  return (Some (object

    method mail = let title = `Item_Notify_Title (mail # subject) in
		  let url   = CMail.link (info # id) None (snd (access # instance # key)) in

		  let! author = ohm (CAvatar.mini_profile (mail # author)) in

		  let payload = `Social (object
		    method pic  = author # pico
		    method name = author # name
		    method context = context
		    method body = `Text (mail # body) 
		  end) in

		  let body = [
		    [ `Item_Notify_Body (access # instance # name)] ;
		    [ `Item_Notify_Body2 ]
		  ] in

		  let button = [ VMailBrick.green `Item_Notify_Button url ] in
		  
		  let footer = CMail.Footer.instance (info # id) uid (access # instance) in
		  VMailBrick.render title payload body button footer
		  

    method act _ = return url

    method item = None

  end))

end 