(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CEvents_admin_common

let () = define UrlClient.Events.def_delegate begin fun parents entity access -> 
  
  O.Box.fill begin 
    
    let! admin = ohm $ O.decay (MEntity.admin_group_name (access # iid)) in 

    let body = Asset_Delegate_List.render (object 
      method kind   = `Event 
      method admins = admin
      method add    = None
    end) in

    Asset_Admin_Page.render (object
      method parents = [ parents # home ; parents # admin ] 
      method here = parents # delegate # title
      method body = body
    end)

  end

end