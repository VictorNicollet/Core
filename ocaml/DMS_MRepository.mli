(* © 2013 RunOrg *)

type 'relation t 

module Vision : Ohm.Fmt.FMT with type t = [ `Normal | `Private of IAvatarSet.t list ]

  module Upload : Ohm.Fmt.FMT with type t = [ `Viewers | `List of IAvatar.t list ]

module Can : sig
  val view  : 'any t -> (#O.ctx,[`View]  t option) Ohm.Run.t
  val admin : 'any t -> (#O.ctx,[`Admin] t option) Ohm.Run.t
  val upload : [<`View|`Admin] t -> (#O.ctx,[`Upload] DMS_IRepository.id option) Ohm.Run.t
end

module Get : sig
  (* Primary properties *)
  val id     :            'any t -> 'any DMS_IRepository.id
  val iid    :            'any t -> IInstance.t
  val vision : [<`Admin|`View] t -> Vision.t
  val name   : [<`Admin|`View] t -> string 
  val admins : [<`Admin|`View] t -> IAvatar.t list 
  val upload : [<`Admin|`View] t -> Upload.t 
  (* Helper properties *)
  val uploaders : [<`Admin|`View] t -> IAvatar.t list   
end

module All : sig
  val visible : 
       ?actor:'any MActor.t
    -> ?start:DMS_IRepository.t
    -> count:int
    -> 'a IInstance.id
    -> (#O.ctx,[`View] t list * DMS_IRepository.t option) Ohm.Run.t
end

module Set : sig
  val admins : 
       IAvatar.t list
    -> [`Admin] t
    -> 'any MActor.t
    -> (#O.ctx,unit) Ohm.Run.t
  val uploaders : 
       IAvatar.t list
    -> [`Admin] t 
    -> 'any MActor.t
    -> (#O.ctx,unit) Ohm.Run.t
  val info : 
       name:string
    -> vision:Vision.t
    -> upload:[`Viewers|`List]
    -> [`Admin] t
    -> 'any MActor.t
    -> (#O.ctx,unit) Ohm.Run.t 
end

val create : 
     self:'any MActor.t
  -> name:string
  -> vision:Vision.t
  -> upload:[`Viewers|`List]
  -> iid:'a IInstance.id
  -> (#O.ctx,DMS_IRepository.t) Ohm.Run.t

val get : ?actor:'any MActor.t -> 'rel DMS_IRepository.id -> (#O.ctx,'rel t option) Ohm.Run.t
val view : ?actor:'any MActor.t -> 'rel DMS_IRepository.id -> (#O.ctx,[`View] t option) Ohm.Run.t
val admin : ?actor:'any MActor.t -> 'rel DMS_IRepository.id -> (#O.ctx,[`Admin] t option) Ohm.Run.t
val delete : [`Admin] t -> 'any MActor.t -> (#O.ctx,unit) Ohm.Run.t
val instance : 'any DMS_IRepository.id -> (#O.ctx,IInstance.t option) Ohm.Run.t