let () =
  let size = 5 in
  let f x _ _ = float_of_int x /. float_of_int size in
  let input = Bigarray.(Array3.init Float32 C_layout size size 1 f) in
  let output = Stb_image_resize.resize_float ~to_width:20 ~to_height:20 input in
  Printf.printf "dims: %d %d %d\n"
    (Bigarray.Array3.dim1 output)
    (Bigarray.Array3.dim2 output)
    (Bigarray.Array3.dim3 output);
  for y = 0 to 19 do
    for x = 0 to 19 do
      Printf.printf "%.2f " output.{x, y, 0}
    done;
    Printf.printf "\n"
  done
