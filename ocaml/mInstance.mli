(* © 2013 RunOrg *)

type t = <
  id      : IInstance.t ;
  key     : IWhite.key ;
  name    : string ;
  disk    : float ;
  create  : float ;
  usr     : IUser.t ;
  ver     : IVertical.t ;
  pic     : [`GetPic] IFile.id option ;
  plugins : IPlugin.t list ; 
> ;;

module Registry : OhmCouchRegistry.REGISTRY with type id = IInstance.t

module Profile : sig

  type t = <
    id       : IInstance.t ;
    name     : string ;
    key      : IWhite.key ;
    address  : string option ;
    contact  : string option ;
    site     : string option ;
    desc     : MRich.OrText.t option ;
    twitter  : string option ;
    facebook : string option ;
    phone    : string option ;
    tags     : string list ;
    pic      : [`GetPic] IFile.id option ;
    search   : bool ;
    unbound  : IUser.t list option ;
  > ;;

  type search = [`WORD of string | `TAG of string]

  val search :
       ?start:IInstance.t
    ->  count:int
    ->  IWhite.t option
    ->  search list
    -> (t list * IInstance.t option) O.run

  val empty : IInstance.t -> t 

  val get : 'any IInstance.id -> t option O.run

  val tag_stats : IWhite.t option -> (string * int) list O.run

  val can_install : t -> [`Old] ICurrentUser.id -> [`CanInstall] IInstance.id option
    
  module Backdoor : sig

    val count : unit -> int O.run

    val update : 
         IInstance.t
      -> name:string
      -> key:IWhite.key
      -> pic:IFile.t option
      -> phone:string option
      -> desc:MRich.OrText.t option
      -> site:string option
      -> address:string option
      -> contact:string option
      -> facebook:string option
      -> twitter:string option
      -> tags:string list
      -> visible:bool
      -> owners:IUser.t list
      -> unit O.run

    val by_key : IWhite.key -> IInstance.t option O.run 

  end

end

module Signals : sig

  val on_create  : ( [`Created] IInstance.id, 
		     unit O.run ) Ohm.Sig.channel
end

val create : 
     pic:[`OwnPic] IFile.id option
  -> who:('any ICurrentUser.id)
  -> key:string 
  -> name:string 
  -> address:string option 
  -> desc:MRich.OrText.t option
  -> site:string option
  -> contact:string option 
  -> vertical:IVertical.t
  -> white:IWhite.t option
  -> [`Created] IInstance.id O.run

val install : 
     [`CanInstall] IInstance.id 
  -> pic:[`OwnPic] IFile.id option
  -> who:('any ICurrentUser.id)
  -> key:string 
  -> name:string 
  -> desc:MRich.OrText.t option
  -> IWhite.key option O.run

val update : 
     [`IsAdmin] IInstance.id
  -> name:string
  -> desc:MRich.OrText.t option
  -> address:string option
  -> site:string option
  -> contact:string option
  -> facebook:string option
  -> twitter:string option
  -> phone:string option
  -> tags:string list
  -> unit O.run

val set_pic : 
     [`IsAdmin] IInstance.id
  -> [`InsPic] IFile.id option
  -> unit O.run 

val by_key : ?fresh:bool -> IWhite.key -> IInstance.t option O.run

val has_plugin : t -> IPlugin.t -> bool 

val get : 'any IInstance.id -> (#Ohm.CouchDB.ctx, t option) Ohm.Run.t

val get_free_space : [`SeeUsage] IInstance.id -> float O.run

val free_name : IWhite.key -> string O.run

val visited : count:int -> 'any ICurrentUser.id -> (#Ohm.CouchDB.ctx, IInstance.t list) Ohm.Run.t
val visit : 'any ICurrentUser.id -> IInstance.t -> unit O.run

module Backdoor : sig

  val count : int O.run

  val relocate : src:IWhite.key -> dest:IWhite.key -> [ `OK | `NOT_FOUND | `EXISTS ] O.run

  val list : count:int -> IInstance.t option -> ((IInstance.t * t) list * IInstance.t option) O.run

  val chronological : 
       [`Admin] ICurrentUser.id
    -> count:int 
    -> float option 
    -> ((IInstance.t * t) list * float option) O.run

  val set_plugins : IPlugin.t list -> IWhite.key -> (#O.ctx,[`OK | `NOT_FOUND]) Ohm.Run.t

  val set_disk : float -> IWhite.key -> (#O.ctx,[`OK | `NOT_FOUND]) Ohm.Run.t

end

