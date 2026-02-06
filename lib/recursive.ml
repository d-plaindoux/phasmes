let ( << ) f g x = f (g x)

module Mu (Kind : Specs.Kind) = struct
  module Kind = Kind

  type 'a t = In of 'a t Kind.t

  let in_r (In x) = x
end

module Nu (Kind : Specs.Kind) = struct
  module Kind = Kind

  type 'a t = Out of 'a t Kind.t

  let out_r (Out x) = x
end

module Catamorphism (Functor : Specs.Functor) = struct
  module Kind = Functor.Kind
  module Mu = Mu (Kind)

  let rec run alg = alg << Functor.map (run alg) << Mu.in_r
end

module Anamorphism (Functor : Specs.Functor) = struct
  module Kind = Functor.Kind
  module Nu = Nu (Kind)

  let rec run coalg = (fun x -> Nu.Out x) << Functor.map (run coalg) << coalg
end

module Hylomorphism (Functor : Specs.Functor) = struct
  module Kind = Functor.Kind

  let rec run alg coalg = alg << Functor.map (run alg coalg) << coalg

  module Catamorphism = struct
    module Kind = Kind
    module Mu = Mu (Kind)

    let run alg = run alg Mu.in_r
  end

  module Anamorphism = struct
    module Kind = Kind
    module Nu = Nu (Kind)

    let run coalg = run (fun x -> Nu.Out x) coalg
  end
end
