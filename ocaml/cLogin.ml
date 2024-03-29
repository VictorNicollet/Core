(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

module Login   = CLogin_login
module Signup  = CLogin_signup
module Logout  = CLogin_logout
module Confirm = CLogin_confirm 

let () = UrlLogin.def_login begin fun req res -> 

  let login = 
    let form = OhmForm.create ~template:Login.template ~source:OhmForm.empty in
    let url  = Action.url UrlLogin.post_login (req # server) (req # args) in
    Asset_Form_Clean.render (OhmForm.Convenience.render form url)
  in 
  
  let signup = 
    let form = OhmForm.create ~template:Signup.template ~source:OhmForm.empty in
    let url  = Action.url UrlLogin.post_signup (req # server) (req # args) in
    Asset_Form_Clean.render (OhmForm.Convenience.render form url)
  in

  let iid = UrlLogin.instance_of (req # args) in
 
  let html = Asset_Login_Page.render (object
    method navbar = (req # server,None,iid)
    method login  = login
    method signup = signup
    method lost   = Js.remote ~url:(Action.url UrlLogin.lost (req # server) (req # args)) ()
  end) in

  CPageLayout.core (req # server) `Login_Title html res

end
    
