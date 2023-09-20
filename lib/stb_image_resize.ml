module R = Stb_image_resize_raw
open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (int, int8_unsigned_elt, c_layout) Array3.t

let io f to_width to_height in_buffer =
  let channels = Bigarray.Array3.dim3 in_buffer in
  let out_buffer =
    Bigarray.Array3.(create (kind in_buffer) (layout in_buffer))
      to_width to_height channels
  in
  let res = f in_buffer out_buffer in
  (res, out_buffer)

let resize_float ~to_width ~to_height buffer =
  let res, out = io R.resize_float to_width to_height buffer in
  assert res;
  out

let resize_uint8 ~to_width ~to_height buffer =
  let res, out = io R.resize_uint8 to_width to_height buffer in
  assert res;
  out
