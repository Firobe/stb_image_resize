module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open Ctypes
  open F

  (*
 int stbir_resize_float(     const float *input_pixels , int input_w , int input_h , int input_stride_in_bytes,
                                           float *output_pixels, int output_w, int output_h, int output_stride_in_bytes,
                                     int num_channels);
                                     *)
  let base typ next =
    ptr typ @-> int @-> int @-> int @-> ptr typ @-> int @-> int @-> int @-> int
    @-> next

  (** Easy interface *)
  let resize_uint8 = foreign "stbir_resize_uint8" (base uchar (returning int))

  let resize_float = foreign "stbir_resize_float" (base float (returning int))

  let resize_uint8_srgb =
    foreign "stbir_resize_uint8_srgb"
      (base uchar (int @-> int @-> returning int))
end
