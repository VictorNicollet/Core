(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CNotifySend_common

let send url uid eid aid = 

  let! iid  = ohm_req_or (return ()) $ MEntity.instance eid in 
  let! instance = ohm_req_or (return ()) $ MInstance.get iid in 

  let! _ = ohm $ MMail.other_send_to_self uid begin fun self user send -> 
  
    let! access = ohm_req_or (return ()) $ access iid self in 
    let! entity = ohm_req_or (return ()) $ MEntity.try_get access eid in 
    let! entity = ohm_req_or (return ()) $ MEntity.Can.view entity in 
    let! entity = ohm $ CEntityUtil.name entity in 

    let! author = ohm $ CAvatar.mini_profile aid in 
    let! name = req_or (return ()) (author # nameo) in
    
    let subject = AdLib.get (`Mail_Notify_EntityInvite_Title (name,entity)) in
    
    let body = Asset_Mail_NotifyEntityInvite.render (object
      method name      = user # fullname
      method inviter   = (name, entity, instance # name)
      method who       = name
      method url       = url 
      method asso      = instance # name
    end) in
    
    let! _, html = ohm $ CMail.Wrap.render ~iid self body in 
    let from = Some name in
    
    send ~from ~subject ~html 
      
  end in
  
  return () 
