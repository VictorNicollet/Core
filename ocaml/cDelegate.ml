(* © 2013 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

module DelPickArgs = Fmt.Make(struct
  type json t = (IAvatar.t list) 
end)

type delegator = <
  get : IAvatar.t list ;
  set : IAvatar.t list -> unit O.run
>

let picker labels back access deleg wrap = 

  let! post = O.Box.react Fmt.Unit.fmt begin fun _ json _ res ->

    let aids = 
      (BatOption.default [] (DelPickArgs.of_json_safe json)) @ (deleg # get)
    in

    let! () = ohm $ O.decay (deleg # set aids) in

    return $ Action.javascript (Js.redirect ~url:back ()) res

  end in

  wrap begin 

    let! submit = ohm $ AdLib.get (labels `Submit) in

    Asset_Search_Pick.render (object
      method submit = submit
      method search = Action.url UrlClient.Search.avatars (access # instance # key) () 
      method post   = OhmBox.reaction_json post () 
    end)

  end

let list ?(admins=true) labels pick access deleg wrap = 

  let delegates = deleg # get in

  let! remove = O.Box.react IAvatar.fmt begin fun aid _ _ res ->
    let aids = List.filter (fun aid' -> aid' <> aid) delegates in
    let! () = ohm $ O.decay (deleg # set aids) in
    return res
  end in 
  
  wrap begin 

    let! admin = ohm $ MGroup.admin_name (access # iid) in     

    let  admins = if admins then Some admin else None in 

    let! delegates = ohm $ Run.list_map begin fun aid ->
      let! profile = ohm $ CAvatar.mini_profile aid in 
      let remove = OhmBox.reaction_endpoint remove aid in 
      return (object
	method pic    = profile # pico
	method name   = profile # name
	method remove = JsCode.Endpoint.to_json remove
      end)
    end delegates in 

    let! help = ohm (AdLib.get (labels `Help)) in

    Asset_Delegate_List.render (object 
      method help      = help
      method admins    = admins
      method delegates = delegates
      method add       = pick
    end)
      
  end
