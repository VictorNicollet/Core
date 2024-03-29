(* © 2012 RunOrg *)

open Ohm
open Ohm.Util
open BatPervasives
open Ohm.Universal

(* General definitions ---------------------------------------------------------------------- *)

module MyDB = CouchDB.Convenience.Database(struct let db = O.db "folder" end)
module Design = struct
  module Database = MyDB
  let name = "folder"
end

module Data = Fmt.Make(struct
  type json t = <
    iid "ins" : IInstance.t ;
    owner : [ `Event "ev" of IEvent.t 
	    | `Discussion "d" of IDiscussion.t ]
  >
end)

module Tbl = CouchDB.Table(MyDB)(IFolder)(Data)

type 'relation t = 
    {
      id    : 'relation IFolder.id ;
      data  : Data.t ;
      read  : bool O.run ;
      write : bool O.run ;
      admin : bool O.run ;
    }

let nil _ = return MAvatarStream.nobody

let _make actor id data = 
  let owner = Run.memo begin
    match data # owner with 
      | `Event eid ->  let! event = ohm_req_or (return nil) $ MEvent.get ~actor eid in
		       return (fun what -> MEvent.Satellite.access event (`Folder what))
      | `Discussion did ->  let! discn = ohm_req_or (return nil) $ MDiscussion.get ~actor did in
			    return (fun what -> MDiscussion.Satellite.access discn (`Folder what))
  end in
  {
    id    = id ;
    data  = data ;
    read  = ( let! f = ohm owner in 
	      let! read = ohm (f `Read) in
	      let! write = ohm (f `Write) in
	      let! manage = ohm (f `Manage) in
	      MAvatarStream.(is_in actor (union [read;write;manage])) ) ;
    write = ( let! f = ohm owner in 
	      let! write = ohm (f `Write) in
	      let! manage = ohm (f `Manage) in
	      MAvatarStream.(is_in actor (write + manage)) ) ;
    admin = ( let! f = ohm owner in 
	      let! manage = ohm (f `Manage) in
	      MAvatarStream.is_in actor manage ) ;
  }

(* Direct access ---------------------------------------------------------------------------- *)

let try_get actor id = 
  let! album_opt = ohm $ Tbl.get (IFolder.decay id) in
  return $ BatOption.map (_make actor id) album_opt

let bot_get id = 
  let! data = ohm_req_or (return None) $ Tbl.get (IFolder.decay id) in
  return $ Some {
    id    = id ;
    data  = data ;
    read  = return false ;
    write = return false ;
    admin = return false
  }

module Get = struct

  let id t = t.id

  let owner t = t.data # owner

  let instance t = t.data # iid

  let write_instance t = 
    (* I can upload, since I can write to the folder *)
    t.data # iid |> IInstance.Assert.upload

end

module Can = struct

  let write t = 
    let! allowed = ohm t.write in
    return begin
      if allowed then Some {
	id    = IFolder.Assert.write t.id ; (* Proven above *)
	data  = t.data ;
	write = return true ;
	read  = return true ;
	admin = t.admin
      }
      else None
    end

  let read t = 
    let! allowed = ohm t.read in
    return begin 
      if allowed then Some {
	id    = IFolder.Assert.read t.id ; (* Proven above *)
	data  = t.data ;
	write = t.write ;
	read  = return true ;
	admin = t.admin 
      } 
      else None
    end

  let admin t = 
    let! allowed = ohm t.admin in
    return begin 
      if allowed then Some {
	id    = IFolder.Assert.admin t.id ; (* Proven above *)
	data  = t.data ;
	write = return true ;
	read  = return true ;
	admin = return true 
      } 
      else None
    end

end

(* Access by entity ------------------------------------------------------------------------ *)

module ByOwnerView = CouchDB.DocView(struct
  module Key = Id
  module Value = Fmt.Unit
  module Doc = Data
  module Design = Design
  let name = "by_owner"
  let map = "if (doc.owner) emit(doc.owner[1]);"
end)

let get_or_create iid owner = 

  let id = IFolderOwner.to_id owner in 

  let! found_opt = ohm (ByOwnerView.doc id |> Run.map Util.first) in

  match found_opt with 
    | Some item -> return (IFolder.of_id (item # id), item # doc)
    | None -> (* Album missing, create one *)
      
      let doc = object
	method owner = IFolderOwner.decay owner
	method iid   = IInstance.decay iid 
      end in 
      
      let! id = ohm $ Tbl.create doc in
      return (id, doc) 

let by_owner iid owner = 
  let! id, _ = ohm $ get_or_create iid owner in 
  return id 

let get_for_owner actor owner =   
  let  iid = MActor.instance actor in 
  let! id, doc = ohm $ get_or_create iid owner in
  return (_make actor id doc)

let try_by_owner owner = 
  let id = IFolderOwner.to_id owner in 
  let! found = ohm_req_or (return None) (ByOwnerView.doc id |> Run.map Util.first) in
  return $ Some (IFolder.of_id (found # id))

(* Owner migration ------------------------------------------------------------------------ *)

let migrate_owner flid floid = 
  let! _ = ohm $ Tbl.update (IFolder.decay flid) (fun folder ->
    (object
      method iid   = folder # iid
      method owner = IFolderOwner.decay floid
     end) 
  ) in
  return () 
