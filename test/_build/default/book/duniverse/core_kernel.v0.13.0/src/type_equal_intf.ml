(*_ This is just to extend Uid with the standard hashability and binability primitives *)

module type Uid = sig
  include module type of struct
    include Base.Type_equal.Id.Uid
  end

  include Comparable.S with type t := t and type comparator_witness := comparator_witness
  include Hashable.S with type t := t
end

module type Id = sig
  include module type of struct
    include Base.Type_equal.Id
  end

  module Uid : Uid
end

module type Type_equal = sig
  (** @open *)
  include module type of struct
    include Base.Type_equal
  end

  module Id : Id
end
