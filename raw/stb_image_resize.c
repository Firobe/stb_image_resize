#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include "stb_image_resize.h"
#include <caml/mlvalues.h>
#include <caml/bigarray.h>
#include <caml/memory.h>
#include <caml/fail.h>
#include <caml/alloc.h>
#include <caml/custom.h>

#define PREPARE_BASIC_PARAMS(type)                              \
    int input_w = Caml_ba_array_val(in_ba)->dim[0];             \
    int input_h = Caml_ba_array_val(in_ba)->dim[1];             \
    type* input_pixels = (type*) Caml_ba_data_val(in_ba);       \
    int output_w = Caml_ba_array_val(out_ba)->dim[0];           \
    int output_h = Caml_ba_array_val(out_ba)->dim[1];           \
    type* output_pixels = (type*) Caml_ba_data_val(out_ba);     \
    int num_channels = Caml_ba_array_val(in_ba)->dim[2];        \
    int input_stride = 0;                                       \
    int output_stride = 0;

#define BASIC_PARAM_NAMES                                            \
    input_pixels, input_w, input_h, input_stride,                    \
    output_pixels, output_w, output_h, output_stride, num_channels

// EASY API

CAMLprim value stbir_resize_uint8_stub(value in_ba, value out_ba) {
    CAMLparam2(in_ba, out_ba);                                  \
    PREPARE_BASIC_PARAMS(unsigned char);
    int res = stbir_resize_uint8(BASIC_PARAM_NAMES);
    CAMLreturn(Val_bool(res));
}

CAMLprim value stbir_resize_float_stub(value in_ba, value out_ba) {
    CAMLparam2(in_ba, out_ba);                                  \
    PREPARE_BASIC_PARAMS(float);
    int res = stbir_resize_float(BASIC_PARAM_NAMES);
    CAMLreturn(Val_bool(res));
}

// MEDIUM API

#define PREPARE_MEDIUM_PARAMS()                                 \
    int alpha_channel = Int_val(_alpha_channel);                \
    int flags = Int_val(_flags);                                \
    stbir_edge edge_wrap_mode = Int_val(_edge_wrap_mode) + 1;   \
    stbir_filter filter = Int_val(_filter);                     \
    stbir_colorspace space = Int_val(_space);                   \
    void* alloc_context = NULL;

#define MEDIUM_PARAM_NAMES                                              \
    alpha_channel, flags, edge_wrap_mode, filter, space, alloc_context

#define MEDIUM_BYTECODE(NAME)                                     \
    CAMLprim value NAME##_stub_bytecode(value* argv, int argc) {  \
        assert (argc == 7);                                       \
        return NAME##_stub(argv[0], argv[1], argv[2], argv[3],    \
                         argv[4], argv[5], argv[6]);              \
    }

CAMLprim value stbir_resize_uint8_generic_stub(value in_ba, value out_ba, value _alpha_channel,
                               value _flags, value _edge_wrap_mode, value _filter,
                               value _space) {
    CAMLparam5(in_ba, out_ba, _alpha_channel, _flags, _edge_wrap_mode);
    CAMLxparam2(_filter, _space);
    PREPARE_BASIC_PARAMS(unsigned char);
    PREPARE_MEDIUM_PARAMS();
    int res = stbir_resize_uint8_generic(BASIC_PARAM_NAMES, MEDIUM_PARAM_NAMES);
    CAMLreturn(Val_bool(res));
}

MEDIUM_BYTECODE(stbir_resize_uint8_generic)

// Skip uint16

CAMLprim value stbir_resize_float_generic_stub(value in_ba, value out_ba, value _alpha_channel,
                               value _flags, value _edge_wrap_mode, value _filter,
                               value _space) {
    CAMLparam5(in_ba, out_ba, _alpha_channel, _flags, _edge_wrap_mode);
    CAMLxparam2(_filter, _space);
    PREPARE_BASIC_PARAMS(float);
    PREPARE_MEDIUM_PARAMS();
    int res = stbir_resize_float_generic(BASIC_PARAM_NAMES, MEDIUM_PARAM_NAMES);
    CAMLreturn(Val_bool(res));
}

MEDIUM_BYTECODE(stbir_resize_float_generic)
