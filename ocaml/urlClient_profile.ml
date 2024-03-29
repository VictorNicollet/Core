(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal 
open BatPervasives

module A = Action.Args

open UrlClient_common

let home,     def_home     = child UrlClient_members.def_home "profile"
let admin,    def_admin    = child def_home  "p/admin"
let viewers,  def_viewers  = child def_admin "p/viewers"
let viewPick, def_viewPick = child def_admin "p/view-pick"

let newForm,  def_newForm  = child def_home "p/new-form"
let editForm, def_editForm = child def_home "p/edit-form"

let tabs = 
  (function 
    | `Groups   -> "groups"
    | `Forms    -> "forms" 
    | `Messages -> "messages"
    | `Images   -> "images"
    | `Files    -> "files"), 
  (function
    | "forms"    -> `Forms
    | "messages" -> `Messages
    | "images"   -> `Images
    | "files"    -> `Files
    | other      -> `Groups)
    

