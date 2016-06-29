
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
      "position", (let x, y, z = t.position in inject (Js.array [| x; y; z |]));
      (* "rotation", inject t.rotation; *)
      (* "easing", inject t.easing; *)
    |]
end

let snabbt elt config =
  let open Js.Unsafe in
  let args = [| inject elt; Config.obj_of config |] in
  fun_call (js_expr "snabbt") args

let example elt =
  let config = {
    Config.position = (100, 0, 0);
    rotation = (0., 0., 3.14);
    easing = `Ease;
  } in
  snabbt elt config

let _ =
  let button_id = "usage-example-execute" in
  let button = Dom_html.getElementById button_id in
  Lwt_js_events.clicks button (fun _ev _thread ->
    Firebug.console##log(Js.string "calling example");
    example button;
    Lwt.return_unit
  )
