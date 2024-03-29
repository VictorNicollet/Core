(* © 2013 RunOrg *)

val user_is_admin : 'any ICurrentUser.id -> [`Admin] ICurrentUser.id option

val user_may_be_admin : 'any IUser.id -> bool

val map : ([`Admin] ICurrentUser.id -> 'a) -> 'a list

val list : unit -> IUser.t list  
