(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

let () = CClient.define UrlClient.Home.def_home begin fun access -> 

  let! feed = ohm $ O.decay (MFeed.get_for_instance access) in
  let! feed = ohm $ O.decay (MFeed.Can.read feed) in

  let! wall = O.Box.add (CWall.box access feed) in

  O.Box.fill begin
    Asset_Home_Page.render (O.Box.render wall)
  end
  
end