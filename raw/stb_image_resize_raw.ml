open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (int, int8_unsigned_elt, c_layout) Array3.t

external resize_uint8 : uint8_image -> uint8_image -> bool
  = "stbir_resize_uint8_stub"

external resize_float : float_image -> float_image -> bool
  = "stbir_resize_float_stub"

type edge = Edge_clamp | Edge_reflect | Edge_wrap | Edge_zero

type filter =
  | Filter_default
  | Filter_box
  | Filter_triangle
  | Filter_cubicspline
  | Filter_catmullfrom
  | Filter_mitchell

type colorspace = Colorspace_linear | Colorspace_sRGB

external resize_uint8_generic :
  uint8_image ->
  uint8_image ->
  int ->
  int ->
  edge ->
  filter ->
  colorspace ->
  bool
  = "stbir_resize_uint8_generic_stub_bytecode" "stbir_resize_uint8_generic_stub"

external resize_float_generic :
  float_image ->
  float_image ->
  int ->
  int ->
  edge ->
  filter ->
  colorspace ->
  bool
  = "stbir_resize_float_generic_stub_bytecode" "stbir_resize_float_generic_stub"
