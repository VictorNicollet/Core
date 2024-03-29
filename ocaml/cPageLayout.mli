(* © 2013 RunOrg *)

val js : deeplink:bool -> string list

val white_css : IWhite.t option -> string list 

val splash : 
     string
  -> Ohm.Html.writer O.run list
  -> Ohm.Action.response
  -> Ohm.Action.response O.run

val core :
     ?deeplink:bool 
  -> IWhite.t option
  -> O.i18n
  -> Ohm.Html.writer O.run
  -> Ohm.Action.response
  -> Ohm.Action.response O.run
