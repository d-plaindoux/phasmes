module type Kind = sig
  type 'a t
end

module type Functor = sig
  module Kind : Kind

  val map : ('a -> 'b) -> 'a Kind.t -> 'b Kind.t
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
  module Functor : Functor
  module Mu : Mu with module Kind = Functor.Kind

  val run : ('a Functor.Kind.t -> 'a) -> _ Mu.t -> 'a
end

module type Anamorphism = sig
  module Functor : Functor
  module Nu : Nu with module Kind = Functor.Kind

  val run : ('a -> 'a Functor.Kind.t) -> 'a -> _ Nu.t
end

module type Hylomorphism = sig
  module Functor : Functor

  val run : ('a Functor.Kind.t -> 'a) -> ('c -> 'c Functor.Kind.t) -> 'c -> 'a

  module Catamorphism : Catamorphism with module Functor = Functor
  module Anamorphism : Anamorphism with module Functor = Functor
end
