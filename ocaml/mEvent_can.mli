(* © 2013 RunOrg *)

include HEntity.CAN with type core = MEvent_core.t and type 'a id = 'a IEvent.id

val member_access : 'any t -> (#O.ctx,MAvatarStream.t) Ohm.Run.t 
