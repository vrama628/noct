open Js_of_ocaml
open Js_of_ocaml_tyxml.Tyxml_js
open React
open ReactiveData
open Base

type state = { reversed : string }

let state, set_state = S.create { reversed = "" }

let app { reversed } =
  let open Html in
  [
    div
      ~a:[a_class ["m-8"; "rounded-lg"; "bg-emerald-500"; "p-8"]]
      [
        div ~a:[a_class ["bg-fuchsia-400"; "text-white"]] [txt "More content"];
        div
          ~a:[a_class ["p-8"; "rounded-lg"; "bg-white"; "shadow"; "m-8"]]
          [txt reversed];
        input
          ~a:
            [
              a_onchange (fun e ->
                  Js.Opt.iter e##.target (fun elt ->
                      Js.Opt.iter (Dom_html.CoerceTo.input elt) (fun str ->
                          let reversed =
                            String.rev (Js.to_string str##.value)
                          in
                          set_state { reversed }
                      )
                  );
                  false
              );
              a_class ["m-8"; "rounded"; "border"; "bg-white"; "p-8"];
            ]
          ();
      ];
  ]

let () =
  Dom.appendChild
    Dom_html.document##.body
    (R.Html.div (RList.from_signal (S.map app state)) |> To_dom.of_element)
