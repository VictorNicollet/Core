(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal 
open BatPervasives

module A = Action.Args

open UrlClient_common

let write,   def_write   = root "write"
let rewrite, def_rewrite = root "rewrite"
let about,   def_about   = root "about"
let picture, def_picture = root "picture"
let picpost, def_picpost = O.declare O.client "picture/post" A.none
