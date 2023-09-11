module CI = Cstubs_internals

external stb_image_resize_stubs_1_stbir_resize_uint8
  : _ CI.fatptr -> int -> int -> int -> _ CI.fatptr -> int -> int -> 
    int -> int -> int
  =
  "stb_image_resize_stubs_1_stbir_resize_uint8_byte9" "stb_image_resize_stubs_1_stbir_resize_uint8"
  

external stb_image_resize_stubs_2_stbir_resize_float
  : _ CI.fatptr -> int -> int -> int -> _ CI.fatptr -> int -> int -> 
    int -> int -> int
  =
  "stb_image_resize_stubs_2_stbir_resize_float_byte9" "stb_image_resize_stubs_2_stbir_resize_float"
  

external stb_image_resize_stubs_3_stbir_resize_uint8_srgb
  : _ CI.fatptr -> int -> int -> int -> _ CI.fatptr -> int -> int -> 
    int -> int -> int -> int -> int
  =
  "stb_image_resize_stubs_3_stbir_resize_uint8_srgb_byte11" "stb_image_resize_stubs_3_stbir_resize_uint8_srgb"
  

type 'a result = 'a
type 'a return = 'a
type 'a fn =
 | Returns  : 'a CI.typ   -> 'a return fn
 | Function : 'a CI.typ * 'b fn  -> ('a -> 'b) fn
let map_result f x = f x
let returning t = Returns t
let (@->) f p = Function (f, p)
let foreign : type a b. string -> (a -> b) fn -> (a -> b) =
  fun name t -> match t, name with
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Pointer _,
                 Function
                   (CI.Primitive CI.Int,
                    Function
                      (CI.Primitive CI.Int,
                       Function
                         (CI.Primitive CI.Int,
                          Function
                            (CI.Primitive CI.Int,
                             Function
                               (CI.Primitive CI.Int,
                                Function
                                  (CI.Primitive CI.Int,
                                   Returns (CI.Primitive CI.Int)))))))))))),
  "stbir_resize_uint8_srgb" ->
  (fun x1 x3 x4 x5 x6 x8 x9 x10 x11 x12 x13 ->
    let CI.CPointer x7 = x6 in
    let CI.CPointer x2 = x1 in
    stb_image_resize_stubs_3_stbir_resize_uint8_srgb x2 x3 x4 x5 x7 x8 x9 x10
    x11 x12 x13)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Pointer _,
                 Function
                   (CI.Primitive CI.Int,
                    Function
                      (CI.Primitive CI.Int,
                       Function
                         (CI.Primitive CI.Int,
                          Function
                            (CI.Primitive CI.Int,
                             Returns (CI.Primitive CI.Int)))))))))),
  "stbir_resize_float" ->
  (fun x14 x16 x17 x18 x19 x21 x22 x23 x24 ->
    let CI.CPointer x20 = x19 in
    let CI.CPointer x15 = x14 in
    stb_image_resize_stubs_2_stbir_resize_float x15 x16 x17 x18 x20 x21 x22
    x23 x24)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Pointer _,
                 Function
                   (CI.Primitive CI.Int,
                    Function
                      (CI.Primitive CI.Int,
                       Function
                         (CI.Primitive CI.Int,
                          Function
                            (CI.Primitive CI.Int,
                             Returns (CI.Primitive CI.Int)))))))))),
  "stbir_resize_uint8" ->
  (fun x25 x27 x28 x29 x30 x32 x33 x34 x35 ->
    let CI.CPointer x31 = x30 in
    let CI.CPointer x26 = x25 in
    stb_image_resize_stubs_1_stbir_resize_uint8 x26 x27 x28 x29 x31 x32 x33
    x34 x35)
| _, s ->  Printf.ksprintf failwith "No match for %s" s


let foreign_value : type a. string -> a Ctypes.typ -> a Ctypes.ptr =
  fun name t -> match t, name with
| _, s ->  Printf.ksprintf failwith "No match for %s" s

