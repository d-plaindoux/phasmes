module type Kind = sig
  type 'a t
end

module type Functor = sig
  include Kind

  val map : ('a -> 'b) -> 'a t -> 'b t
end

module type Mu = sig
  module Kind : Kind

  type 'a t = In of 'a t Kind.t

  val in_r : 'a t -> 'a t Kind.t
end

module type Nu = sig
  module Kind : Kind

  type 'a t = Out of 'a t Kind.t

  val out_r : 'a t -> 'a t Kind.t
end

module type Catamorphism = sig
  module Kind : Kind
  module Mu : Mu with module Kind = Kind

  val run : ('a Kind.t -> 'a) -> _ Mu.t -> 'a
end

module type Anamorphism = sig
  module Kind : Kind
  module Nu : Nu with module Kind = Kind

  val run : ('a -> 'a Kind.t) -> 'a -> _ Nu.t
end

module type Hylomorphism = sig
  module Kind : Kind

  val run : ('a Kind.t -> 'a) -> ('c -> 'c Kind.t) -> 'c -> 'a

  module Catamorphism : sig
    module Mu : Mu with module Kind = Kind

    val run : ('a Kind.t -> 'a) -> _ Mu.t -> 'a
  end

  module Anamorphism : sig
    module Nu : Nu with module Kind = Kind

    val run : ('a -> 'a Kind.t) -> 'a -> _ Nu.t
  end
end
