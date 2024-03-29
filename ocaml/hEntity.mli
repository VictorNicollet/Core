(* © 2013 RunOrg *)

(* Core module --------------------------------------------------------------------------------------------- *)

module type CORE = sig
  type t 
  type diff 
  module Id  : Ohm.CouchDB.ID
  module Raw : Ohm.Fmt.READ_FMT with type t = t 
  module Tbl : Ohm.CouchDB.READ_TABLE with type id = Id.t and type elt = Raw.t
  module Design : Ohm.CouchDB.DESIGN 
  val update : Id.t -> 'any MActor.t -> diff list -> (O.ctx,unit) Ohm.Run.t
  val create : Id.t -> 'any MActor.t -> Raw.t -> diff list -> (O.ctx,unit) Ohm.Run.t 
  val on_update : (Id.t,unit O.run) Ohm.Sig.channel 
  val on_version : (Id.t * diff list,unit O.run) Ohm.Sig.channel
end 

module type CORE_ARG = sig
  val name : string
  module Id : Ohm.CouchDB.ID
  module Data : Ohm.Fmt.FMT
  module Diff : Ohm.Fmt.FMT
  val apply : Diff.t -> (Id.t -> float -> Data.t -> Data.t O.run) O.run
end

module Core : functor(C:CORE_ARG) ->
  CORE with type t = C.Data.t and type diff = C.Diff.t and type Id.t = C.Id.t

(* Access ("can") module ----------------------------------------------------------------------------------- *)

module type CAN = sig 

  type core 
  type 'a id 

  type 'relation t
    
  val make : 'a id -> ?actor:'any MActor.t -> core -> 'a t option 

  val id   : 'any t -> 'any id
  val data : 'any t -> core

  val test : 'any t -> MAvatarStream.t -> (#O.ctx,bool) Ohm.Run.t 

  val view_access   : 'any t -> (#O.ctx,MAvatarStream.t) Ohm.Run.t
  val admin_access  : 'any t -> (#O.ctx,MAvatarStream.t) Ohm.Run.t 
    
  val view  : 'any t -> (#O.ctx,[`View]  t option) Ohm.Run.t 
  val admin : 'any t -> (#O.ctx,[`Admin] t option) Ohm.Run.t 
    
  val decay : 'any id -> [`Unknown] id

  val deleted : core -> bool 
  val iid : core -> IInstance.t

end

module type CAN_ARG = sig
  type core
  type 'a id
  val deleted : core -> bool
  val iid : core -> IInstance.t
  val admin : core -> (#O.ctx,MAvatarStream.t) Ohm.Run.t
  val view : core -> (#O.ctx,MAvatarStream.t) Ohm.Run.t
  val id_view  : 'a id -> [`View] id
  val id_admin : 'a id -> [`Admin] id 
  val decay : 'a id -> [`Unknown] id 
  val public : core -> bool 
end

module Can : functor(C:CAN_ARG) -> CAN with type core = C.core and type 'a id = 'a C.id

(* Mutation ("set") module ---------------------------------------------------------------------------------- *)

module type SET = sig
  type 'a can  
  type diff 
  type 'a id 
  type ('a,'ctx) t = [`Admin] can -> 'a MActor.t -> ('ctx,unit) Ohm.Run.t
  val update : diff list -> ('any,#O.ctx) t
  val raw : diff list -> 'a id -> 'b MActor.t -> (#O.ctx,unit) Ohm.Run.t 
end

module Set : functor(C:CAN) -> functor(S:CORE with type Id.t = [`Unknown] C.id) ->
  SET with type 'a can = 'a C.t and type diff = S.diff and type 'a id = 'a C.id

(* Load ("get") module -------------------------------------------------------------------------------------- *)

module Get : functor(C:CAN) -> functor(S:CORE with type Id.t = [`Unknown] C.id and type t = C.core) -> sig
  val get : ?actor:'any MActor.t -> 'rel C.id -> (#O.ctx,'rel C.t option) Ohm.Run.t
  val view : ?actor:'any MActor.t -> 'rel C.id -> (#O.ctx,[`View] C.t option) Ohm.Run.t
  val admin : ?actor:'any MActor.t -> 'rel C.id -> (#O.ctx,[`Admin] C.t option) Ohm.Run.t
end

(* Atom reflection module ---------------------------------------------------------------------------------- *)

module type ATOM = sig
  type t 
  val key     : string
  val nature  : IAtom.Nature.t
  val limited : t -> bool
  val hide    : t -> bool 
  val name    : t -> string O.run
end 

module Atom : 
  functor(C:CAN) -> 
    functor(S:CORE with type Id.t = [`Unknown] C.id and type t = C.core) -> 
      functor(A:ATOM with type t = C.core) -> 
sig
  val refresh_atoms : [`Admin] ICurrentUser.id -> (#O.ctx,unit) Ohm.Run.t
end
