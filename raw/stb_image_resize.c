#define STB_IMAGE_RESIZE_IMPLEMENTATION
#define STBIR_DEFAULT_FILTER_DOWNSAMPLE STBIR_FILTER_TRIANGLE
#include "stb_image_resize.h"
#include <caml/mlvalues.h>
#include <caml/bigarray.h>


value stbir_resize_float_stub(value in_ba, value out_ba) {
    int input_w = Caml_ba_array_val(in_ba)->dim[0];
    int input_h = Caml_ba_array_val(in_ba)->dim[1];
    float* input_pixels = (float*) Caml_ba_data_val(in_ba);
    int output_w = Caml_ba_array_val(out_ba)->dim[0];
    int output_h = Caml_ba_array_val(out_ba)->dim[1];
    float* output_pixels = (float*) Caml_ba_data_val(out_ba);
    int num_channels = Caml_ba_array_val(in_ba)->dim[2];
    int input_stride = 0;
    int output_stride = 0;
    int res = stbir_resize_float(input_pixels, input_w, input_h, input_stride,
                                 output_pixels, output_w, output_h, output_stride,
                                 num_channels);
    return Val_bool(res);
}

value stbir_resize_uint8_stub(value in_ba, value out_ba) {
    int input_w = Caml_ba_array_val(in_ba)->dim[0];
    int input_h = Caml_ba_array_val(in_ba)->dim[1];
    unsigned char* input_pixels = (unsigned char*) Caml_ba_data_val(in_ba);
    int output_w = Caml_ba_array_val(out_ba)->dim[0];
    int output_h = Caml_ba_array_val(out_ba)->dim[1];
    unsigned char* output_pixels = (unsigned char*) Caml_ba_data_val(out_ba);
    int num_channels = Caml_ba_array_val(in_ba)->dim[2];
    int input_stride = 0;
    int output_stride = 0;
    int res = stbir_resize_uint8(input_pixels, input_w, input_h, input_stride,
                                 output_pixels, output_w, output_h, output_stride,
                                 num_channels);
    return Val_bool(res);
}
