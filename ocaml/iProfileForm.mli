(* © 2013 RunOrg *)

include Ohm.Id.PHANTOM

module Assert : sig
  val view : 'any id -> [`View] id
  val edit : 'any id -> [`Edit] id
end

module Deduce : sig
end

module Kind : sig

  include Ohm.Fmt.FMT with type t = PreConfig_ProfileFormId.t

  val to_string : t -> string
  val of_string : string -> t option

end
