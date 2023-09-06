(lang dune 3.6)
(using ctypes 0.2)
(name stb_image_resize)

(generate_opam_files true)


(package
  (name stb_image_resize)
  (synopsis "Bindings to stb's image resizing library")
  (description "Bindings to stb's image resizing library")
  (depends
    ctypes
    (ctypes (< 0.21.0))
    (dune :build)))
