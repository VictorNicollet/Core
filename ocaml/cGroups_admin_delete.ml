(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CGroups_admin_common

let () = define UrlClient.Members.def_delete begin fun parents group access -> 
  
  let! submit = O.Box.react Fmt.Unit.fmt begin fun _ _ _ res -> 

    (* Save the changes to the database *)

    let! () = ohm $ MGroup.delete group (access # actor) in

    (* Redirect to entity home *)

    let url = Action.url UrlClient.Members.home (access # instance # key) [] in

    return $ Action.javascript (Js.redirect url ()) res

  end in   
  
  O.Box.fill begin 

    Asset_Admin_Page.render (object
      method parents = [ parents # home ; parents # admin ] 
      method here = parents # delete # title
      method body = Asset_Group_Delete.render (object
	method cancel = parents # admin # url
	method del = JsCode.Endpoint.to_json 
	  (OhmBox.reaction_endpoint submit ())
      end)
    end)

  end

end
