module R = Stb_image_resize_raw
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

let exec_basic f to_width to_height in_buffer =
  let channels = Bigarray.Array3.dim3 in_buffer in
  let out_buffer =
    Bigarray.Array3.(create (kind in_buffer) (layout in_buffer))
      to_width to_height channels
  in
  let res = f in_buffer out_buffer in
  (res, out_buffer)

let resize_uint8 ~to_width ~to_height buffer =
  let res, out = exec_basic R.resize_uint8 to_width to_height buffer in
  assert res;
  out

let resize_float ~to_width ~to_height buffer =
  let res, out = exec_basic R.resize_float to_width to_height buffer in
  assert res;
  out

let resize_uint8_generic ~to_width ~to_height ?(alpha_channel = -1)
    ?(edge = R.Edge_clamp) ?(filter = R.Filter_default)
    ?(space = R.Colorspace_linear) buffer =
  let f, out = exec_basic R.resize_uint8_generic to_width to_height buffer in
  let res = f alpha_channel 0 edge filter space in
  assert res;
  out

let resize_float_generic ~to_width ~to_height ?(alpha_channel = -1)
    ?(edge = R.Edge_clamp) ?(filter = R.Filter_default)
    ?(space = R.Colorspace_linear) buffer =
  let f, out = exec_basic R.resize_float_generic to_width to_height buffer in
  let res = f alpha_channel 0 edge filter space in
  assert res;
  out
