(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CAdmin_common

module Parents = CAdmin_parents

module AddInstanceAdmin = CAdmin_API_addInstanceAdmin

let () = UrlAdmin.def_api $ admin_only begin fun cuid req res -> 

  let html = Asset_Admin_Api.render (object
    method endpoints = UrlAdmin.API.all_endpoints (req # server)
  end) in

  page cuid "Administration" (object
    method parents = [ Parents.home ] 
    method here  = Parents.api # title 
    method body  = html
  end) res

end
