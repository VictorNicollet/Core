(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal 
open BatPervasives

module A = Action.Args

let args = A.n A.string

let login,       def_login       = O.declare O.secure "login"        args
let post_login,  def_post_login  = O.declare O.secure "login/post"   args
let post_signup, def_post_signup = O.declare O.secure "login/signup" args
let logout,      def_logout      = O.declare O.secure "logout"       A.none
let lost,        def_lost        = O.declare O.secure "lost"         args
let post_lost,   def_post_lost   = O.declare O.secure "lost/post"    args

let instance_of = function
  | []           -> None
  | "me"    :: _ -> None
  | "start" :: _ -> None
  | iid     :: _ -> Some (IInstance.of_string iid) 

let path_of = function
  | []              -> []
  | "me"    :: path -> "me" :: path
  | "start" :: path -> "start" :: path 
  | _       :: path -> path

let save_url ?iid path = 
  match iid with 
    | Some iid -> IInstance.to_string iid :: path
    | None     -> path

