include Ctypes
let lift x = x
open Ctypes_static

let rec field : type t a. t typ -> string -> a typ -> (a, t) field =
  fun s fname ftype -> match s, fname with
  | View { ty; _ }, _ ->
    let { ftype; foffset; fname } = field ty fname ftype in
    { ftype; foffset; fname }
  | _ -> failwith ("Unexpected field "^ fname)

let rec seal : type a. a typ -> unit = function
  | Struct { tag; spec = Complete _; _ } ->
    raise (ModifyingSealedType tag)
  | Union { utag; uspec = Some _; _ } ->
    raise (ModifyingSealedType utag)
  | View { ty; _ } -> seal ty
  | _ ->
    raise (Unsupported "Sealing a non-structured type")

type 'a const = 'a
let constant (type t) name (t : t typ) : t = match t, name with
  | _, s -> failwith ("unmatched constant: "^ s)

let enum (type a) name ?typedef ?unexpected (alist : (a * int64) list) =
  match name with
  | s ->
    failwith ("unmatched enum: "^ s)
