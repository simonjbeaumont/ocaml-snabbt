
(*
type easing = [
  | `Linear
  | `Ease
  | `EaseIn
  | `EaseOut
]

module Config = struct
  type t = {
    position: int * int * int;
    rotation: float * float * float;
    easing: easing;
  }

  let obj_of t =
    let open Js.Unsafe in
    obj [|
      "position", inject t.position;
      "rotation", inject t.rotation;
      "easing", inject t.easing;
    |]
end

let snabbt elt config =
  let open Js.Unsafe in
  let args = [| inject elt; Config.obj_of config |] in
  fun_call (js_expr "snabbt") args
  *)
