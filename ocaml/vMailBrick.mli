(* © 2013 RunOrg *)

type social = <
  pic     : string option ;
  name    : string ; 
  context : string ;
  body    : MRich.OrText.t 
>

type action = <
  pic     : string option ;
  name    : string ; 
  action  : O.i18n ; 
  text    : string ; 
  html    : Ohm.Html.writer ;
>

type footer = <
  white : IWhite.t option ;
  name  : string option ;
  url   : string option;
  unsub : string ;
>

type payload = 
  [ `None
  | `Social of social 
  | `Action of action ]

type result = <
  title : string ; 
  html : Ohm.Html.writer ;
  text : string
>

type body = O.i18n list list

type button = <
  color : [ `Green | `Grey ] ;
  url   : string ;
  label : O.i18n
>

val render : O.i18n -> payload -> body -> button -> footer -> (#O.ctx,result) Ohm.Run.t