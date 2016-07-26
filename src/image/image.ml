open Core_kernel.Std

type color = {
  r: int;
  g: int;
  b: int;
}

type t = {
  width: int;
  height: int;
  data: color array;
}


let create width height gen = {
  width;
  height;
  data = Array.init (width * height) ~f:(fun (idx) ->
      let w = idx / width in
      let h = idx mod width in
      gen (w, h))
}

let width x = x.width
let height x = x.height

let pixel_at t x y = t.data.(x * t.height + y)

let to_ppm { width; height; data } =
  let format_row colors =
    List.map colors ~f:(fun {r; g; b} -> Printf.sprintf "%03d %03d %03d" r g b)
    |> String.concat ~sep:" "
  in
  let pixels = Array.to_sequence data
               |> (fun s -> Sequence.chunks_exn s width)
               |> Sequence.map ~f:format_row
               |> Sequence.to_list
               |> String.concat ~sep:"\n"
  in
  Printf.sprintf "P3 %d %d\n255\n%s" width height pixels
