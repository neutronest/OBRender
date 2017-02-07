open Core.Std
let () =
  let bookmark_json = "/home/neutronest/.config/chromium/Default/Bookmarks" in
  let json_data = Yojson.Basic.from_file bookmark_json in
  let open Yojson.Basic.Util in
  let checksum = json_data |> member "checksum" |> to_string in
  print_endline "hello world!";
  print_endline checksum
