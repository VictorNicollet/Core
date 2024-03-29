(* © 2013 RunOrg *)

type content = 
  [ `Post of < title : string ; body : MRich.OrText.t > 
  | `RSS  of < title : string ; body : OhmSanitizeHtml.Clean.t ; link : string > ] 

type forward = <
  id     : IBroadcast.t ;
  from   : IInstance.t ;
  author : IAvatar.t option ;
  time   : float 
> ;;

type t = <
  id       : IBroadcast.t ;
  from     : IInstance.t ;
  author   : IAvatar.t option ;
  forwards : int ;
  time     : float ;
  forward  : forward option ;
  content  : content
> ;;

module Signals : sig
  val on_create : (IBroadcast.t, unit O.run) Ohm.Sig.channel
end 

val post : 
     [`IsAdmin] IInstance.id
  -> [`IsSelf] IAvatar.id
  -> content
  -> IBroadcast.t O.run

val edit : 
     [`IsAdmin] IInstance.id
  -> [`IsSelf] IAvatar.id
  -> IBroadcast.t
  -> content
  -> unit O.run  

val forward : 
     [`IsAdmin] IInstance.id 
  -> [`IsSelf] IAvatar.id
  -> IBroadcast.t
  -> unit O.run

val get_summary : IBroadcast.t -> (float * string) option O.run

val previous : IInstance.t -> float -> float option O.run

val get : IBroadcast.t -> t option O.run

val forwards : IBroadcast.t -> forward list O.run

val latest : 
     ?start:float
  ->  count:int
  -> IInstance.t 
  -> (#Ohm.CouchDB.ctx, t list * float option) Ohm.Run.t

val all_latest : 
     ?start:float
  ->  int
  -> (#Ohm.CouchDB.ctx, t list * float option) Ohm.Run.t

val recent_ids : IInstance.t -> count:int -> IBroadcast.t list O.run

val count : IInstance.t -> int O.run

val remove : 
     [`IsAdmin] IInstance.id 
  -> [`IsSelf] IAvatar.id
  -> IBroadcast.t
  -> unit O.run

module Backdoor : sig

  val posts : int O.run
  val forwards : int O.run

  val active_instances : [`Admin] ICurrentUser.id -> int -> (IInstance.t * int) list O.run

end
