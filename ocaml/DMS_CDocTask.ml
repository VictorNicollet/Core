(* © 2013 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open DMS_CDocTask_common

let () = CClient.define Url.Task.def_create begin fun access ->

  let  e404 = O.Box.fill (Asset_Client_PageNotFound.render ()) in

  let  actor = access # actor in 
  let! rid = O.Box.parse IRepository.seg in
  let! did = O.Box.parse IDocument.seg in 

  let! doc = ohm_req_or e404 $ MDocument.view ~actor did in

  let processes = PreConfig_Task.DMS.all in

  O.Box.fill begin 

    let processes = List.map begin fun pid -> (object
      method label = PreConfig_Task.DMS.label pid 
    end) end processes in

    Asset_Admin_Page.render (object
      method parents = [ parent (access # instance # key) rid doc ]
      method here = AdLib.get `DMS_DocTask_Create
      method body = Asset_DMS_CreateTask.render (object
	method processes = processes
	method url = Json.Null
      end)
    end)

  end 

end