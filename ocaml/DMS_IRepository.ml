(* © 2013 RunOrg *)

open Ohm
open BatPervasives
  
include Id.Phantom

module Assert = struct 
  let admin  = identity
  let view   = identity
  let upload = identity  
  let remove = identity
end
