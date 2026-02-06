module Mu : functor (Kind : Specs.Kind) -> Specs.Mu with module Kind = Kind
module Nu : functor (Kind : Specs.Kind) -> Specs.Nu with module Kind = Kind

module Catamorphism : functor (Functor : Specs.Functor) ->
  Specs.Catamorphism with module Kind = Functor

module Anamorphism : functor (Functor : Specs.Functor) ->
  Specs.Anamorphism with module Kind = Functor

module Hylomorphism : functor (Functor : Specs.Functor) ->
  Specs.Hylomorphism with module Kind = Functor
