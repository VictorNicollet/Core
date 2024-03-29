(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CGroups_admin_common

let delegator group access = object (self)
  method get = MGroup.Get.admins group
  method set aids = MGroup.Set.admins aids group (access # actor) 
end

let labels lbl = `Group_Delegate_Label lbl

let () = define UrlClient.Members.def_delpick begin fun parents group access ->

  let back = parents # delegate # url in

  let wrap body = 
    O.Box.fill begin 
      Asset_Admin_Page.render (object
	method parents = [ parents # home ; parents # admin ; parents # delegate ] 
	method here = parents # delpick # title
	method body = O.decay body
      end)
    end
  in

  CDelegate.picker labels back access (delegator group access) wrap 

end

let () = define UrlClient.Members.def_delegate begin fun parents group access -> 

  let! is_admin = ohm $ MGroup.Get.is_admin group in

  let pick = if is_admin then None else Some (parents # delpick # url) in 

  let wrap body = 
    O.Box.fill begin 
      Asset_Admin_Page.render (object
	method parents = [ parents # home ; parents # admin ] 
	method here = parents # delegate # title
	method body = O.decay body
      end)	
    end
  in

  CDelegate.list labels pick access (delegator group access) wrap

end
