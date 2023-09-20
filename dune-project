(lang dune 3.6)
(name stb_image_resize)
(source (github Firobe/stb_image_resize))
(maintainers "Virgile Robles <virgile.robles@pm.me>")
(authors "Virgile Robles <virgile.robles@pm.me>")

(generate_opam_files true)

(package
  (name stb_image_resize)
  (synopsis "Bindings to stb's image resizing library")
  (description "Bindings to stb's image resizing library")
  (depends (dune :build)))
