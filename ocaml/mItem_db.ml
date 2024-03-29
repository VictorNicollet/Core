(* © 2012 RunOrg *)

open Ohm

module MyDB = CouchDB.Convenience.Database(struct let db = O.db "item" end)

module Design = struct
  module Database = MyDB
  let name = "item"
end

module Tbl = CouchDB.Table(MyDB)(IItem)(MItem_data)

module ByAvatarView = CouchDB.DocView(struct
  module Key    = IAvatar
  module Value  = Fmt.Unit
  module Doc    = MItem_data
  module Design = Design
  let name = "by_avatar"
  let map  = "if (doc.p[1].a) emit(doc.p[1].a);" 
end)
