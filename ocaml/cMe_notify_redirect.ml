(* © 2012 RunOrg *)

open Ohm
open Ohm.Universal
open BatPervasives

open CMe_common

let none = return None

let access cuid iid = 
  let! isin = ohm $ MAvatar.identify iid cuid in
  let! isin = req_or none $ IIsIn.Deduce.is_token isin in
  let! self = ohm $ MAvatar.get isin in 
  return $ Some (object
    method self = self
    method isin = isin
   end)



let item_url cuid itid = 
  let! iid     = ohm_req_or none $ MItem.iid itid in
  let! access  = ohm_req_or none $ access cuid iid in
  let! item    = ohm_req_or none $ MItem.try_get access itid in
  let! instance = ohm_req_or none $ MInstance.get (item # iid) in 			      
  match item # where with 
    | `feed fid -> begin
      let! feed = ohm_req_or none $ MFeed.try_get access fid in 
      match MFeed.Get.owner feed with 
	| `of_instance _ -> return $ Some (Action.url UrlClient.Home.home (instance # key) [])
	| `of_entity eid -> begin 
	  let! entity = ohm_req_or none $ MEntity.try_get access eid in 
	  return $ Some (Action.url 
	    (if MEntity.Get.kind entity = `Event then UrlClient.Events.see else UrlClient.Forums.see) 
	    (instance # key) [ IEntity.to_string eid ])
	end 
	| `of_message  _ -> return None
    end
    | `album  aid -> return None
    | `folder fid -> return None		
		 
let url cuid notify =
  (* We're looking for an URL, so it's safe to act as a confirmed user *)
  let cuid = ICurrentUser.Assert.is_old cuid in  
  match notify # payload with 

    | `NewUser _ -> return None

    | `NewJoin (_,aid) -> let! p = ohm $ CAvatar.mini_profile aid in
			  return $ Some (p # url) 

    | `NewInstance (iid,_) -> let! instance = ohm_req_or none $ MInstance.get iid in 
			      return $ Some (Action.url UrlClient.website (instance # key) ())

    | `BecomeMember (iid,_)
    | `BecomeAdmin (iid,_) -> let! instance = ohm_req_or none $ MInstance.get iid in 
			      return $ Some (Action.url UrlClient.Home.home (instance # key) [])

    | `NewWallItem (_,itid) 
    | `NewFavorite (_,_,itid) -> item_url cuid itid

    | `NewComment (_,cid) -> let! itid = ohm_req_or none $ MComment.item cid in 
			     item_url cuid itid