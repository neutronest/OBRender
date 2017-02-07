open Core.Std
(* open local module *)
open Bookmark

let parse_bookmark_children json =
  [json]
  |> filter_member ""

let () =
  let bookmark_json = "/home/neutronest/.config/chromium/Default/Bookmarks" in
  let json_data = Yojson.Basic.from_file bookmark_json in
  let open Yojson.Basic.Util in
  let checksum = json_data |> member "checksum" |> to_string in
  let bookmark_data = json_data |> member "roots" |> member "bookmark_bar" in 
  print_endline "hello world!";
  print_endline checksum
