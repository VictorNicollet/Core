(* © 2013 RunOrg *)

val start : [ `Old of [`Old] ICurrentUser.id 
	    | `New of [`New] ICurrentUser.id ] -> Ohm.Action.response -> Ohm.Action.response

val check : ('a,'b) Ohm.Action.request -> [ `None 
					  | `Old of [`Old] ICurrentUser.id 
					  | `New of [`New] ICurrentUser.id ]

val get : ('a,'b) Ohm.Action.request -> ICurrentUser.t option

val decay : [ `None 
	    | `Old of [`Old] ICurrentUser.id 
	    | `New of [`New] ICurrentUser.id ] -> ICurrentUser.t option

val close : Ohm.Action.response -> Ohm.Action.response
