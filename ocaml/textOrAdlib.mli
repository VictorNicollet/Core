(* © 2013 RunOrg *)

include Ohm.Fmt.FMT with type t = [ `label of PreConfig_Adlibs.t | `text of string ]

val to_string : t -> (O.i18n #Ohm.AdLib.ctx,string) Ohm.Run.t
val to_html : t -> (O.i18n #Ohm.AdLib.ctx,Ohm.Html.writer) Ohm.Run.t
