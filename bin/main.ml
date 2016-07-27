let (x, y) = let open Geom in
  (add i (scale 92.0 j), add (add i j) k)


let () = Geom.cross x y |> Geom.v_to_string |> print_endline
