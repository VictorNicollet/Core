(* © 2013 RunOrg *)

type 'relation t 

module Satellite : sig

  type action = 
    [ `Wall   of [ `Manage | `Read | `Write ]
    | `Folder of [ `Manage | `Read | `Write ]
    ]

  val access : 'any t -> action -> (#O.ctx,MAvatarStream.t) Ohm.Run.t

end

module Signals : sig
  val on_bind_inboxLine : (INewsletter.t, unit O.run) Ohm.Sig.channel
  val on_update : (INewsletter.t, unit O.run) Ohm.Sig.channel
  val on_send : (INewsletter.t * IAvatarSet.t list, unit O.run) Ohm.Sig.channel
end

module Can : sig
  val view  : 'any t -> (#O.ctx,[`View]  t option) Ohm.Run.t 
  val admin : 'any t -> (#O.ctx,[`Admin] t option) Ohm.Run.t 
end

module Get : sig
  val id       :            'any t ->'any INewsletter.id
  val title    : [<`Admin|`View] t -> string
  val update   : [<`Admin|`View] t -> float
  val creator  : [<`Admin|`View] t -> IAvatar.t
  val iid      :            'any t -> IInstance.t 
  val groups   : [<`Admin|`View] t -> (IAvatarSet.t * float) list
  val body     : [<`Admin|`View] t -> MRich.OrText.t
end

val create : 
     'any MActor.t
  -> title:string
  -> body:MRich.OrText.t
  -> (#O.ctx,INewsletter.t) Ohm.Run.t

module Set : sig

  val edit : 
       title:string
    -> body:MRich.OrText.t
    -> [`Admin] t
    -> 'any MActor.t
    -> (#O.ctx,unit) Ohm.Run.t

  val send : 
       [`Admin] IGroup.id list
    -> [`Admin] t
    -> 'any MActor.t
    -> (#O.ctx,unit) Ohm.Run.t
    
end

val get : ?actor:'any MActor.t -> 'rel INewsletter.id -> (#O.ctx,'rel t option) Ohm.Run.t

val view : ?actor:'any MActor.t -> 'rel INewsletter.id -> (#O.ctx,[`View] t option) Ohm.Run.t

val admin : ?actor:'any MActor.t -> 'rel INewsletter.id -> (#O.ctx,[`Admin] t option) Ohm.Run.t

val delete : 
     [`Admin] t 
  -> 'any MActor.t
  -> (#O.ctx,unit) Ohm.Run.t

