(* © 2012 RunOrg *)

type 'a id = 
  [ `Event    of 'a IEvent.id 
  | `Entity   of 'a IEntity.id 
  | `Instance of 'a IInstance.id 
  ]

include Ohm.Fmt.FMT with type t = [`Unknown] id 

val decay : 'a id -> t 

val to_id : 'a id -> Ohm.Id.t