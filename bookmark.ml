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
  children: json option 
}


