module R = Stb_image_resize_raw.C.Function
open Bigarray

type float_image = (float, float32_elt, c_layout) Array3.t
type uint8_image = (Unsigned.uchar, int8_unsigned_elt, c_layout) Array3.t

let io f to_width to_height buffer =
  let in_ptr = Ctypes.(bigarray_start array3 buffer) in
  let input_w, input_h, channels =
    Bigarray.Array3.(dim1 buffer, dim2 buffer, dim3 buffer)
  in
  let out =
    Bigarray.Array3.(create (kind buffer) (layout buffer))
      to_width to_height channels
  in
  let out_ptr = Ctypes.bigarray_start Ctypes.array3 out in
  (out, f in_ptr input_w input_h 0 out_ptr to_width to_height 0 channels)

let resize_float ~to_width ~to_height buffer =
  let out, res = io R.resize_float to_width to_height buffer in
  assert (res <> 0);
  out

let resize_uint8 ~to_width ~to_height buffer =
  let out, res = io R.resize_uint8 to_width to_height buffer in
  assert (res <> 0);
  out
