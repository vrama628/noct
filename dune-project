(lang dune 3.4)

(name noct)

(generate_opam_files true)

(source
 (github vrama628/noct))

(authors "Vijay Ramamurthy")

(maintainers "Vijay Ramamurthy")

(package
 (allow_empty)
 (name noct)
 (synopsis "OCaml reactive UI demo")
 (depends
  js_of_ocaml
  tyxml
  react
  reactiveData
  js_of_ocaml-tyxml
  base
  tyxml.functor))
