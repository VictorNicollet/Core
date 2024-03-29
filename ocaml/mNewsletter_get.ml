(* © 2013 RunOrg *)

module Core = MNewsletter_core
module Can  = MNewsletter_can 

type 'a t = 'a Can.t 

let id t = Can.id t

open Core
let (!!) t = Can.data t 

let title   t = (!!t).title
let update  t = (!!t).time
let creator t = (!!t).crea
let iid     t = (!!t).iid
let groups  t = (!!t).gids
let body    t = (!!t).body

