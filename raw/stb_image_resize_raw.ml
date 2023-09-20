open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (int, int8_unsigned_elt, c_layout) Array3.t

external resize_float : float_image -> float_image -> bool
  = "stbir_resize_float_stub"

external resize_uint8 : uint8_image -> uint8_image -> bool
  = "stbir_resize_uint8_stub"
