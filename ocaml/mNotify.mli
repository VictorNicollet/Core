(* © 2012 RunOrg *)

module Payload : sig

  type t = 
    [ `NewWallItem  of [`WallReader|`WallAdmin] * IItem.t
    | `NewFavorite  of [`ItemAuthor] * IAvatar.t * IItem.t
    | `NewComment   of [`ItemAuthor|`ItemFollower] * IComment.t
    | `BecomeMember of IInstance.t * IAvatar.t 
    | `BecomeAdmin  of IInstance.t * IAvatar.t  
    | `NewInstance  of IInstance.t * IAvatar.t 
    | `NewUser      of IUser.t 
    | `NewJoin      of IInstance.t * IAvatar.t 
    ]

  val author : 'any ICurrentUser.id -> t -> 
    [ `RunOrg of IInstance.t option 
    | `Person of (IAvatar.t * IInstance.t) ] option O.run 

  val channel : t -> MNotifyChannel.t

end

module Store : sig

  type t = <
    id      : INotify.t ; 
    payload : Payload.t ;
    time    : float ;
    seen    : bool 
  >

  val create : ?stats:INotifyStats.t -> Payload.t -> IUser.t -> unit O.run

  val get_mine : 'any ICurrentUser.id -> INotify.t -> t option O.run 

  val all_mine : count:int -> ?start:float -> 'any ICurrentUser.id -> (t list * float option) O.run  

  val count_mine : 'any ICurrentUser.id -> int O.run 

  val rotten : INotify.t -> unit O.run 

end 

module Stats : sig

  val from_mail : INotify.t -> unit O.run 

  val from_site : INotify.t -> unit O.run 
    
  val get : INotifyStats.t -> < created : int ; sent : int ; seen : int > O.run 

end

val get_token  : INotify.t -> string 

val from_token : 
     INotify.t
  -> string 
  -> [`Old] ICurrentUser.id option
  -> [ `Valid   of [`Old] ICurrentUser.id
     | `Expired
     | `Missing 
     | `New     of [`New] ICurrentUser.id
     ] O.run 