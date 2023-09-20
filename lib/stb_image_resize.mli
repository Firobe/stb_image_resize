(** stb_image_resize library *)

open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (int, int8_unsigned_elt, c_layout) Array3.t

type edge = Stb_image_resize_raw.edge =
  | Edge_clamp
  | Edge_reflect
  | Edge_wrap
  | Edge_zero

type filter = Stb_image_resize_raw.filter =
  | Filter_default
  | Filter_box
  | Filter_triangle
  | Filter_cubicspline
  | Filter_catmullfrom
  | Filter_mitchell

type colorspace = Stb_image_resize_raw.colorspace =
  | Colorspace_linear
  | Colorspace_sRGB

val resize_uint8 : to_width:int -> to_height:int -> uint8_image -> uint8_image
val resize_float : to_width:int -> to_height:int -> float_image -> float_image

val resize_uint8_generic :
  to_width:int ->
  to_height:int ->
  ?alpha_channel:int ->
  ?edge:edge ->
  ?filter:filter ->
  ?space:colorspace ->
  uint8_image ->
  uint8_image

val resize_float_generic :
  to_width:int ->
  to_height:int ->
  ?alpha_channel:int ->
  ?edge:edge ->
  ?filter:filter ->
  ?space:colorspace ->
  float_image ->
  float_image
