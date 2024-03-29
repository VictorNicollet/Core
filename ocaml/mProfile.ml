(* © 2012 RunOrg *)

open Ohm
open Ohm.Util
open BatPervasives
open Ohm.Universal

module MyDB = MModel.MainDB
module Design = struct
  module Database = MyDB
  let name = "profile"
end

module Data = struct
      
  type t = {
    firstname : string ;
    lastname  : string ;
    email     : string option ;
    birthdate : Date.t option ;
    phone     : string option ;
    cellphone : string option ;
    address   : string option ;
    zipcode   : string option ;
    city      : string option ;
    country   : string option ;
    picture   : [`GetPic] IFile.id option ;
    gender    : [`m|`f] option 
  } ;;          

  module Inner = struct
    type json t = {
      firstname : string ;
      lastname  : string ;
      email     : string option ;
      birthdate : Date.RevCompat.t ;
      phone     : string option ;
      cellphone : string option ;
      address   : string option ;
      zipcode   : string option ;
      city      : string option ;
      country   : string option ;
      picture   : IFile.t option ;
      gender    : [`m|`f] option ;
    } ;;    
  end 
   
  let of_json j = 
    let o = Inner.t_of_json j in
    let t = {
      firstname = o.Inner.firstname ;
      lastname  = o.Inner.lastname ;
      email     = o.Inner.email ;
      birthdate = o.Inner.birthdate ;
      phone     = o.Inner.phone ;
      cellphone = o.Inner.cellphone ;
      address   = o.Inner.address ;
      zipcode   = o.Inner.zipcode ;
      city      = o.Inner.city ;
      country   = o.Inner.country ;
      picture   = BatOption.map IFile.Assert.get_pic o.Inner.picture ; (* view profile *)
      gender    = o.Inner.gender 
    } in
    t

  let to_json t = 
    let oclip n s = BatOption.map (clip n) s in
    Inner.json_of_t {
      Inner.firstname =  clip 50  t.firstname ;
      Inner.lastname  =  clip 50  t.lastname ;
      Inner.email     = oclip 80  t.email ; 
      Inner.birthdate = t.birthdate ; 
      Inner.phone     = oclip 20  t.phone ; 
      Inner.cellphone = oclip 20  t.cellphone ; 
      Inner.address   = oclip 100 t.address ; 
      Inner.zipcode   = oclip 10  t.zipcode ; 
      Inner.city      = oclip 80  t.city ; 
      Inner.country   = oclip 80  t.country ; 
      Inner.picture   = BatOption.map IFile.decay t.picture ;
      Inner.gender    = t.gender
    }
 
  let fmt = to_json, Fmt.protect of_json
 
  let field v = function
    | `Birthdate -> Json.of_opt Date.to_json   (v.birthdate) 
    | `Phone     -> Json.of_opt Json.of_string (v.phone) 
    | `Cellphone -> Json.of_opt Json.of_string (v.cellphone) 
    | `Address   -> Json.of_opt Json.of_string (v.address) 
    | `Zipcode   -> Json.of_opt Json.of_string (v.zipcode) 
    | `City      -> Json.of_opt Json.of_string (v.city) 
    | `Country   -> Json.of_opt Json.of_string (v.country) 
    | `Gender    -> Json.of_opt 
      (function `m -> Json.Int 0 | `f -> Json.Int 1) (v.gender) 

  let apply list =
    if list = [] then None else
      Some (fun v ->
	List.fold_left (fun v (key,json) ->
	  try 
	    match key with 
	      | `Birthdate -> { v with birthdate = Json.to_opt Date.of_json   json }
	      | `Phone     -> { v with phone     = Json.to_opt Json.to_string json }
	      | `Cellphone -> { v with cellphone = Json.to_opt Json.to_string json }
	      | `Address   -> { v with address   = Json.to_opt Json.to_string json }
	      | `Zipcode   -> { v with zipcode   = Json.to_opt Json.to_string json }
	      | `City      -> { v with city      = Json.to_opt Json.to_string json }
	      | `Country   -> { v with country   = Json.to_opt Json.to_string json }
	      | `Gender    -> { v with gender = match json with 
		  | Json.Int 0 -> Some `m
		  | Json.Int 1 -> Some `f
		  | _          -> None }
	  with _ -> v
	) v list
      )

end

module Profile = struct
  module T = struct
    type json t = {
      t          : MType.t ;
      ins     "i" : IInstance.t ;
      user    "u" : IUser.t ;
      data    "d" : Data.t ; 
     ?parents "p" : IAvatar.t list = [] ; 
     ?share   "s" : MFieldShare.t list option ;
     ?source  "o" : MFieldShare.t list = []
    }
  end 
  include T
  include Fmt.Extend(T)
end

module Tbl = CouchDB.Table(MyDB)(IProfile)(Profile)

include Profile

module Signals = struct

  let on_update_call,     on_update     = Sig.make (Run.list_iter identity)
  let on_obliterate_call, on_obliterate = Sig.make (Run.list_iter identity)

end

let empty_data = Data.({
  firstname = "" ;
  lastname  = "" ;
  email     = None ;
  birthdate = None ;
  phone     = None ;
  cellphone = None ;
  address   = None ;
  zipcode   = None ;
  city      = None ;
  country   = None ;
  picture   = None ;	  
  gender    = None ;
})

let sharing_filter list oldlist refresh old = 
  let has x = List.mem x list in
  let had x = List.mem x oldlist in
  let keep cond f default = 
    if has cond then f refresh else 
      if had cond then default else f old
  in
  Data.({
    firstname = keep `basic     (fun x -> x.firstname) "" ;
    lastname  = keep `basic     (fun x -> x.lastname)  "" ;
    picture   = keep `basic     (fun x -> x.picture)   None ;
    birthdate = keep `birth     (fun x -> x.birthdate) None ;    
    email     = keep `email     (fun x -> x.email)     None ;
    phone     = keep `phone     (fun x -> x.phone)     None ;
    cellphone = keep `cellphone (fun x -> x.cellphone) None ;
    address   = keep `address   (fun x -> x.address)   None ;
    city      = keep `city      (fun x -> x.city)      None ;
    zipcode   = keep `city      (fun x -> x.zipcode)   None ;
    gender    = keep `gender    (fun x -> x.gender)    None ;
    country   = keep `country   (fun x -> x.country)   None ;
  }) 

let load_from_user share previous uid = 
  let! user = ohm_req_or (return ([], empty_data)) $ MUser.get uid in
  let share  = match share with None -> user # share | Some share -> share in 
  let imported = 
    Data.({
      firstname = BatOption.default "" user # firstname ;
      lastname  = BatOption.default "" user # lastname ;
      email     = Some (user # email) ;
      birthdate = user # birthdate ;
      phone     = user # phone ;
      cellphone = user # cellphone ;
      address   = user # address ;
      zipcode   = user # zipcode ;
      city      = user # city ;
      country   = user # country ;
      picture   = user # picture ;
      gender    = user # gender ;
    })
  in 
  return (share, sharing_filter share previous imported empty_data)

let create_from_user iid uid = 

  (* When creating a profile from an user, we know that we can read user data. *)
  let uid = IUser.Assert.bot uid in 
  let pid = IProfile.gen () in

  let! source, data = ohm $ load_from_user None [] (IUser.Deduce.view uid) in

  let insert = {
    t       = `Profile ;
    ins     = iid ; 
    user    = IUser.decay uid ;
    share   = None ;
    parents = [] ; 
    source  ;
    data    ;
  } in
  
  (* We just created the object. *)
  let created = IProfile.Assert.updated pid in
  
  let! () = ohm $ Tbl.set pid insert in 
  let! () = ohm $ Signals.on_update_call (created , IUser.decay uid, iid, data) in

  return pid

module Find = Fmt.Make(struct
  type json t = (IInstance.t * IUser.t)
end)

module FindView = CouchDB.DocView(struct
  module Key    = Find
  module Value  = Fmt.Unit
  module Doc    = Profile
  module Design = Design
  let name = "find"
  let map  = "if (doc.t == 'pfle') emit([doc.i,doc.u],null)" 
end)

let create iid data = 

  let iid   = IInstance.decay iid in
  let share = None in 

  (* Apply a first round of sharing to the old data *)

  let! instance = ohm $ MInstance.get iid in 
  let  white    = BatOption.bind instance (#key %> snd) in 

  let! (uid, source, data) = ohm $ 
    let! uid_opt = ohm $ Run.opt_bind MUser.by_email data.Data.email in
    match uid_opt with 
      | Some uid ->

	(* user exists : share! *)
	let uid = IUser.Assert.bot uid in
	let! source, new_data = ohm $ load_from_user share [] (IUser.Deduce.view uid) in
	return (IUser.decay uid, source, new_data)

      | None      ->

	(* user does not exist : create one, don't bother sharing because we already 
	   have the data *)
	let user_data = object
	  method firstname = data.Data.firstname
	  method lastname  = data.Data.lastname
	  method email     = match data.Data.email with Some e -> e | None -> ""
	  method picture   = 
	    (* Profile is available *)
	    BatOption.map IFile.Assert.get_pic data.Data.picture
	  method birthdate = data.Data.birthdate
	  method phone     = data.Data.phone
	  method cellphone = data.Data.cellphone
	  method address   = data.Data.address
	  method zipcode   = data.Data.zipcode
	  method city      = data.Data.city 
	  method country   = data.Data.country
	  method gender    = data.Data.gender
	  method white     = white
	end in
	let! uid = ohm $ MUser.user_bind user_data in
	return (uid, [], data) 
  in 

  let! profile = ohm $ FindView.doc (iid,uid) in

  match profile with 

    | [] -> begin
      
      let pid      = IProfile.gen () in
      let insert   = {
	t       = `Profile ;
	ins     = iid ;
	user    = uid ;
	parents = [] ;  
	data    ;
	source  ;
	share   ;
      } in
      
      (* We just created the object. *)      
      let created = IProfile.Assert.updated pid in
      
      let! _  = ohm $ Tbl.set pid insert in 
      let! () = ohm $ Signals.on_update_call (created, uid, iid, data) in
      
      return (`ok uid)

    end 

    | _ :: _ -> return (`exists uid)

let update pid f = 

  let  pid = IProfile.decay pid in 
  let! ( ) = ohm $ Tbl.update pid (fun t -> { t with data = f t.data }) in
  
  let  updated = IProfile.Assert.updated pid in
  let! what = ohm_req_or (return ()) (Tbl.get pid) in
  Signals.on_update_call (updated, what.user, what.ins, what.data)
      
let data id = 
  let id = IProfile.decay id in
  Tbl.get id |> Run.map (BatOption.map (fun p -> p.source, p.data))

let find_or_create iid uid =
  let! self = ohm (FindView.doc (iid,uid) |> Run.map Util.first) in
  match self with 
    | Some v -> return (IProfile.of_id v # id)
    | None   -> create_from_user iid uid 

let find iid uid = 
  FindView.doc (iid,uid)
  |> Run.map (Util.first %> BatOption.map (fun v -> IProfile.of_id v # id))

let find_view iid uid = 
  find (IInstance.decay iid) uid  
  (* Can view profiles *)
  |> Run.map (BatOption.map IProfile.Assert.view)

let refresh uid iid =
  
  let iid = IInstance.decay   iid
  and uid = IUser.Deduce.view uid in

  let! profiles = ohm $ FindView.doc (iid,IUser.decay uid) in
  let! profile  = req_or (return ()) (Util.first profiles) in
    
  let id = IProfile.of_id (profile # id) in
 
  let update = function
    | None         -> return (None, `keep) 
    | Some profile -> let !source, data = ohm $
			load_from_user profile.share profile.source uid
		      in
		      return (
			Some data, `put { profile with source ; data }
		      )
  in
  
  let! data_opt = ohm $ Tbl.transact id update in
  
  let! () = ohm begin
    match data_opt with 
      | Some data -> let updated = IProfile.Assert.updated id in
		     Signals.on_update_call (updated, IUser.decay uid, iid, data)
      | None      -> return ()
  end in 
  
  return ()
	    
type details = <
  firstname : string ;
  lastname  : string ;
  email     : string option ; 
  picture   : [`GetPic] IFile.id option
> ;;

let details id = 
  let id = IProfile.decay id in
  let! profile = ohm_req_or (return None) $ Tbl.get id in
  let data = profile.data in 
  let picture = 
    (* If profile is visible, so is the picture. *)
    BatOption.map IFile.Assert.get_pic data.Data.picture
  in
  return (
    Some Data.( object
      method firstname = data.firstname
      method lastname  = data.lastname			  
      method email     = data.email
      method picture   = picture
    end )
  )

module Sharing = struct

  let get pid = 
    let id = IProfile.decay pid in
    Tbl.get id |> Run.map begin function 
      | None         -> None
      | Some profile -> profile.share
    end

  let set pid share = 

    let id = IProfile.decay pid in
    let update = function
      | None -> return (None, `keep)
      | Some profile -> 
	(* I can view the user data to refresh the profile. *)
	let  uid = IUser.Assert.bot profile.user in
	let! source, data = ohm $ load_from_user share profile.source 
	  (IUser.Deduce.view uid) in 
	return (
	  Some (data, profile.ins, profile.user) , `put { profile with source ; data ; share }
	)
    in

    let! data, iid, uid = ohm_req_or (return ()) $ Tbl.transact id update in 

    let updated = IProfile.Assert.updated pid in
    Signals.on_update_call (updated, uid, iid, data)

end

(* Is a given person a parent of that profile ? *)

let is_parent aid pid = 
  let! profile = ohm_req_or (return false) $ Tbl.get (IProfile.decay pid) in 
  return (List.mem (IAvatar.decay aid) profile.Profile.parents) 

let get_parents pid = 
  let! profile = ohm_req_or (return []) $ Tbl.get (IProfile.decay pid) in 
  return profile.Profile.parents 

let set_parents pid aids = 
  Tbl.update (IProfile.decay pid)
    (fun profile -> Profile.({ profile with parents = aids })) 

(* Obliterate all profiles of a deleted user. *)

module ByUser = CouchDB.DocView(struct
  module Key    = IUser
  module Value  = Fmt.Unit
  module Doc    = Fmt.Unit
  module Design = Design
  let name = "find"
  let map  = "if (doc.t == 'pfle') emit(doc.u,null)" 
end)

let _ = 
  let obliterate pid = 
    let! profile = ohm_req_or (return ()) $ Tbl.get pid in 
    let! () = ohm $ Signals.on_obliterate_call (pid, profile.user, profile.ins) in
    let! ()  = ohm $ Tbl.delete pid in 
    return ()
  in
  let on_user_obliterated uid = 
    let! list = ohm $ ByUser.doc uid in 
    let! () = ohm $ Run.list_iter (#id %> IProfile.of_id %> obliterate) list in 
    return () 
  in
  Sig.listen MUser.Signals.on_obliterate on_user_obliterated

