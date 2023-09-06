(** stb_image_resize library *)

open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (Unsigned.uchar, int8_unsigned_elt, c_layout) Array3.t

val resize_float : to_width:int -> to_height:int -> float_image -> float_image
val resize_uint8 : to_width:int -> to_height:int -> uint8_image -> uint8_image
