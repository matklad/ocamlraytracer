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
  data = Array.init (width * height) (fun (idx) ->
      let w = idx / width in
      let h = idx mod width in
      gen (w, h))
}

let width x = x.width
let height x = x.height

let pixel_at t x y = Array.get t.data (x * t.heightt + y)
