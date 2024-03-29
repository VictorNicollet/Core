(* © 2013 RunOrg *)

open Ohm
open BatPervasives
open Ohm.Universal

module E         = MGroup_core

let on_delete_call, on_delete = Sig.make (Run.list_iter identity)
let on_update_call, on_update = Sig.make (Run.list_iter identity)
let on_bind_group_call, on_bind_group = Sig.make (Run.list_iter identity)

let () = 
  let! gid = Sig.listen E.on_update in 
  on_update_call gid 
