(* © 2012 RunOrg *)

open Ohm
open BatPervasives
open Ohm.Universal

let max_text_size = 50000
let max_title_size = 250

module Signals = MItem_signals
module Types   = MItem_types

open MItem_db
open MItem_common

let create ~payload ~delayed ~where ~iid (itid:[`Created] IItem.id) = 

  let id   = IItem.decay itid     in
  let time = Unix.gettimeofday () in 

  let obj = object
    method del      = false
    method delayed  = delayed
    method where    = decay where
    method time     = time
    method clike    = []
    method nlike    = 0
    method ccomm    = []
    method ncomm    = 0
    method payload  = payload
    method iid      = IInstance.decay iid
  end in

  let! () = ohm $ Tbl.set id obj in
  let! () = ohm $ Signals.on_post_call (Types.bot_item_of_data id obj) in

  return () 
  
let image actor album =  

  let  instance = MAlbum.Get.write_instance album in 
  let  user     = MActor.user actor in 
  let  self     = MActor.avatar actor in 
  let  itid     = IItem.Assert.created (IItem.gen ()) (* Creating it right now *) in

  (* Attempt to create image-uploader on this instance *)
  let! img = ohm_req_or (return None) $ MFile.Upload.prepare_img 
    ~ins:instance
    ~usr:(IUser.Deduce.is_anyone user)
    ~item:itid
  in
  
  (* Prepare item contents *)
  let payload = `Image (object
    method author = IAvatar.decay self
    method file   = IFile.decay img 
  end) in

  let where = `album (IAlbum.decay (MAlbum.Get.id album)) in 

  let iid = IInstance.decay instance in 

  (* Create the item with the contents. *)
  let! () = ohm $ create ~where ~payload ~delayed:true ~iid itid in

  return $ Some (itid, img)
  
let doc actor folder =  

  let  instance = MFolder.Get.write_instance folder in 
  let  user     = MActor.user actor in 
  let  self     = MActor.avatar actor in 
  let  itid     = IItem.Assert.created (IItem.gen ()) (* Creating it right now *) in

  (* Attempt to create file-uploader on this instance. *)
  let! doc = ohm_req_or (return None) $ MFile.Upload.prepare_doc 
    ~ins:instance
    ~usr:(IUser.Deduce.is_anyone user)
    ~item:itid
    ()
  in

  (* Prepare item contents *)
  let where = `folder (IFolder.decay (MFolder.Get.id folder)) in

  let payload = `Doc (object 
    method author = IAvatar.decay self
    method file   = IFile.decay doc
    method title  = "" 
    method ext    = `File
    method size   = 0.
  end) in

  let iid = IInstance.decay instance in

  (* Create the item with the contents. *)
  let! () = ohm $ create ~where ~payload ~delayed:true ~iid itid in

  return $ Some (itid, doc)

let message actor text iid where = 
  
  let payload = `Message (object
    method author = IAvatar.decay (MActor.avatar actor)
    method text   = if String.length text > max_text_size then String.sub text 0 max_text_size else text
  end) in

  let where = `feed where in 

  let itid = IItem.Assert.created (IItem.gen ()) in

  let! () = ohm $ create ~where ~payload ~delayed:false ~iid itid in

  return itid

let mail actor ~subject text iid where = 
  
  let payload = `Mail (object
    method author  = IAvatar.decay (MActor.avatar actor)
    method subject = if String.length subject > max_title_size then String.sub subject 0 max_title_size else subject
    method body    = if String.length text > max_text_size then String.sub text 0 max_text_size else text
  end) in

  let where = `feed where in 

  let itid = IItem.Assert.created (IItem.gen ()) in

  let! () = ohm $ create ~where ~payload ~delayed:false ~iid itid in

  return itid


let poll actor text poll iid where = 
  
  let payload = `MiniPoll (object
    method author = IAvatar.decay (MActor.avatar actor)
    method text   = if String.length text > max_text_size then String.sub text 0 max_text_size else text
    method poll   = IPoll.decay poll 
  end) in

  let where = `feed where in 

  let itid = IItem.Assert.created (IItem.gen ()) in

  let! () = ohm $ create ~where ~payload ~delayed:false ~iid itid in

  return itid
