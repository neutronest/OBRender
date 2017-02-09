open Yojson.Basic
open Yojson.Basic.Util
open String
type bookmark_type = Url | Folder

type bookmark_item = {
  timestamp: string;
  id: string;
  meta_info: string;
  item_type: bookmark_type;
  name: string;
  url: string;
  children: bookmark_item list
}

let wrap_to_string json_with_null =
  match json_with_null with
  `String s -> s
  | _ -> "-42"

let wrap_to_list json_with_null =
  match json_with_null with
    `List l -> l
  | _ -> []

let rec new_bookmark_item json_data =
  let timestamp_ = json_data |> member "date_added" |> wrap_to_string in
  let id_ = json_data |> member "id" |> wrap_to_string  in
  let meta_info_ = json_data |> member "meta_info" |> wrap_to_string in
  let item_type_ =
    let type_str = json_data |> member "type" |> wrap_to_string in
    match type_str with
    | "url" -> Url
    | "folder" -> Folder
    | _ -> Url in
  let name_ = json_data |> member "name" |> wrap_to_string in
  let url_ = json_data |> member "url" |> wrap_to_string  in
  let children_ =
    let children_json = json_data |> member "children"  |> wrap_to_list in
    List.map new_bookmark_item children_json in
  {
    timestamp = timestamp_;
    id = id_;
    meta_info = meta_info_;
    item_type = item_type_;
    name = name_;
    url = url_;
    children = children_;
  }

let rec print_bookmark (item: bookmark_item) =
  let rec go tab_length item = 
    print_endline ((String.make tab_length '\t')^item.name);
    List.iter (go (tab_length+1)) item.children;
  in go 0 item
