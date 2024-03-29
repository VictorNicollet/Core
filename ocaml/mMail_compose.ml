(* © 2013 RunOrg *) 

open Ohm
open Ohm.Universal
open BatPervasives

module Core    = MMail_core
module Plugins = MMail_plugins
module Send    = MMail_send
module Spam    = MMail_spam

module UnsentView = CouchDB.DocView(struct
  module Key = Date
  module Value = Fmt.Unit
  module Doc = Core.Data
  module Design = Core.Design
  let name = "unsent"
  let map = "if (!doc.dead && doc.sent === null && doc.zapped === null && !doc.blocked) emit(doc.time);"
end)

(* Returns [false] if it KNOWS that there are no more unsent emails
   left in the queue. [true] if there might still be more. *)
let one f = 

  let! now = ohmctx (#date) in	

  let rec retry n = 
    if n <= 0 then return true else 

      let! list = ohm (UnsentView.doc_query ~limit:1 ()) in
      match list with [] -> return false | item :: _ -> 
	let  mid = IMail.of_id (item # id) in
	
	let! locked = ohm (Core.Tbl.transact mid Core.Data.(function 
	  | None -> return (false, `keep) 
	  | Some t -> if t.sent <> None then return (false,`keep) else
	      return (true, `put { t with sent = Some now }))) in
	
	(* Lock to avoid having two bots multi-send an email... *)    
	if not locked then retry (n - 1) else 
	  let! () = ohm (f mid (item # doc)) in
	  return true
  in

  (* Discard up to 5 lock collisions, to avoid taking up too much time. *)
  retry 5

let delay = 10.0 (* seconds *)

(* Renderer function, provided from the outside. *) 
let render = ref None
let setRenderer f = 
  render := Some f

let () = O.async # periodic 1 begin 
  let! result = ohm $ one begin fun mid t ->	  
    let! _ = ohm $ Send.send t.Core.Data.uid begin fun uid u send ->

      let! allowed = ohm begin 
	match t.Core.Data.iid with 		     
	| None -> Spam.can_send uid
	| Some iid -> let! attitude = ohm (Spam.attitude uid iid) in 
		      match attitude with 
		      | `Bounced
		      | `Blocked -> return false
		      | `Allowed 
		      | `NewContact
		      | `Silent _ -> return true
      end in 

      let! () = true_or (Core.blocked mid) allowed in 

      let  rotten = Core.rot mid in
      let! full   = ohm_req_or rotten (O.decay (Plugins.parse_mail uid u mid t)) in

      let! subject, payload, body, buttons = ohm (full # mail) in
      let  owid   = u # white in
      let  iid    = full # info # iid in
      let  from   = full # info # from in

      let  block  = None in 

      match !render with 
      | None -> assert false
      | Some render -> 
	let! result = ohm (render ~mid ~uid ~owid ~block ~subject ~payload ~body ~buttons ?iid ?from ()) in	
	send 
	  ?from:(result # from) 
	  ~owid 
	  ~subject:(result # subject) 
	  ~text:(result # text) 
	  ~html:(result # html) ()

    end in 
    return () 
  end in
  return (if result then None else Some delay)
end 
