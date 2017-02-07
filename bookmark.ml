open Yojson.Basic
open Yojson.Basic.Util

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

let rec new_bookmark_item json_data =
  let timestamp_ = json_data |> member "date_added" |> to_string in
  let id_ = json_data |> member "id" |> to_string in
  let meta_info_ = json_data |> member "meta_info" |> to_string in
  let item_type_ =
    let type_str = json_data |> member "type" |> to_string in
    match type_str with
    | "url" -> Url
    | "folder" -> Folder
    | _ -> Url in
  let name_ = json_data |> member "name" |> to_string in
  let url_ = json_data |> member "url" |> to_string in
  let children_ =
    let children_json = json_data |> member "children" |> to_list in
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
