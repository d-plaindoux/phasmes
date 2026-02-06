(lang dune 3.20)
(name phasmes)
(version dev)
(generate_opam_files)
(using mdx 0.4)
(maintenance_intent "(latest)")

(source (github dplaindoux/phasmes))
(license MIT)
(authors
  "d-plaindoux <d.plaindoux@free.fr>")
(maintainers
  "d-plaindoux <d.plaindoux@free.fr>")

(package
 (name phasmes)
 (synopsis "Implementation of Fantastic Morphisms and Where to Find Them A Guide to Recursion Schemes")
 (description "Implementation of Fantastic Morphisms and Where to Find Them A Guide to Recursion Schemes")
 (allow_empty)
 (depends
  (ocaml (>= 5.4.0))
   
  ;; dev setup
  (utop :with-dev-setup)
  (ocamlformat :with-dev-setup)
  (ocp-indent :with-dev-setup)
  (merlin :with-dev-setup)
  (ocaml-lsp-server :with-dev-setup)))

