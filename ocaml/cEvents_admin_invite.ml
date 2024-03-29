(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CEvents_admin_common

let () = define UrlClient.Events.def_invite begin fun parents event access -> 
  
  let fail = O.Box.fill begin

    let body = Asset_Event_DraftNoPeople.render (parents # edit # url) in

    Asset_Admin_Page.render (object
      method parents = [ parents # home ; parents # admin ; parents # people ] 
      method here = parents # invite # title
      method body = body
    end)

  end in 

  let wrapper body = 
    Asset_Admin_Page.render (object
      method parents = [ parents # home ; parents # admin ; parents # people ] 
      method here = parents # invite # title
      method body = body
    end)
  in

  let  actor = access # actor in 
  let  draft = MEvent.Get.draft event in 

  let  gid = MEvent.Get.group event in
  let! group = ohm $ O.decay (MAvatarSet.try_get actor gid) in
  let! group = ohm $ O.decay (Run.opt_bind MAvatarSet.Can.admin group) in
  let  group = if draft then None else group in   
  let! group = req_or fail group in 

  let url s = 
    Action.url UrlClient.Events.invite (access # instance # key) 
      [ IEvent.to_string (MEvent.Get.id event) ; s ]
  in

  let back = 
    Action.url UrlClient.Events.people (access # instance # key) 
      [ IEvent.to_string (MEvent.Get.id event) ]
  in

  CInvite.box `Event url back access (MAvatarSet.Get.id group) wrapper

end
