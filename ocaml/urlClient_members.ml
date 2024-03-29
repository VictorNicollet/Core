(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal 
open BatPervasives

include UrlClient_common

let home,     def_home     = root "members"
let create,   def_create   = child def_home     "mbr/create"
let admin,    def_admin    = child def_create   "mbr/admin"
let edit,     def_edit     = child def_admin    "mbr/edit"
let people,   def_people   = child def_admin    "mbr/people"
let join,     def_join     = child def_people   "mbr/join"
let invite,   def_invite   = child def_people   "mbr/invite"
let jform,    def_jform    = child def_admin    "mbr/jform"
let cols,     def_cols     = child def_people   "mbr/cols" 
let delete,   def_delete   = child def_admin    "mbr/delete"
let delegate, def_delegate = child def_admin    "mbr/delegate"
let delpick,  def_delpick  = child def_delegate "mbr/delpick"
