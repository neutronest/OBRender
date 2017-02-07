open Core.Std
open Bookmark
open Printf

let () =
  let bookmark_json = "Bookmarks.json" in
  let json_data = Yojson.Basic.from_file bookmark_json in
  let open Yojson.Basic.Util in
  let checksum = json_data |> member "checksum" |> to_string in
  print_endline "hello world!";
  print_endline checksum;
 
