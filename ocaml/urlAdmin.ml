(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal 
open BatPervasives

module A = Action.Args

let home,     def_home     = O.declare O.secure "admin" A.none
let active,   def_active   = O.declare O.secure "admin/active" (A.o A.int)
let public,   def_public   = O.declare O.secure "admin/public" (A.o A.int) 
let instance, def_instance = O.declare O.secure "admin/instance" (A.r IInstance.arg)