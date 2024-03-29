(* © 2013 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

module Footer = CMail_footer

module Mail = MMail.Register(struct
  include Fmt.Make(struct type json t = < iid : IInstance.t option ; uid : IUser.t > end)
  let id = IMail.Plugin.of_string "obliterate"
  let iid _ = None
  let uid = (#uid)
  let from _ = None
  let solve _ = None
  let item _ = false
end) 

let () = Mail.define begin fun uid u t info -> 
  return (Some (object

    method item = None

    method act _ = let uuid = IUser.Deduce.unsubscribe uid in
		   let! result = ohm $ MUser.obliterate uuid in
		   let result = match result with 
		     | `ok        -> "ok"
		     | `destroyed -> "destroyed"
		     | `missing   -> "missing"
		   in
		   return (Action.url UrlMail.post_unsubscribe (u # white) (t # uid, result, t # iid))

    method mail = let  title = `Mail_Unsubscribe_Title in

		  let  body  = [
		    [ `Mail_Unsubscribe_Intro (u # fullname) ] ; 
		    [ `Mail_Unsubscribe_Explanation (u # email) ] ;
		    [ `Mail_Unsubscribe_Warning ] ; 
		    [ `Mail_Unsubscribe_Thanks ] ; 
		  ] in
		  
		  let buttons = [ VMailBrick.grey `Mail_Unsubscribe_Button 
				    (Action.url UrlMail.link (u # white) 
				       (info # id, MMail.get_token info # id, None)) ] in
		  
		  return (title,`None,body,buttons)

  end))
end 

let () = UrlMail.def_unsubscribe begin fun req res -> 

  let uid, iid = req # args in

  let title = AdLib.get `Unsubscribe_Send_Title in

  let html = Asset_Unsubscribe_Send.render (object
    method navbar = (req # server, None, iid)
    method title  = title 
  end) in

  let! () = ohm $ Mail.send_one (object 
    method iid = iid 
    method uid = uid 
  end) in

  CPageLayout.core (req # server) `Unsubscribe_Send_Title html res

end

let () = UrlMail.def_post_unsubscribe begin fun req res -> 
  
  let uid, result, iid = req # args in

  let title, html = 
    match result with 
      | "ok"        -> `Unsubscribe_Confirm_Title,   Asset_Unsubscribe_Confirm.render 
      | "destroyed" -> `Unsubscribe_Destroyed_Title, Asset_Unsubscribe_Destroyed.render  
      | _           -> `Unsubscribe_Missing_Title,   Asset_Unsubscribe_Missing.render  
  in

  let html = html (object
    method navbar = (req # server, None,iid)
    method title  = AdLib.get title 
  end) in

  CPageLayout.core (req # server) title html res
	  
end
