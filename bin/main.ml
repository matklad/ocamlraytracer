let image = let open Image in create 200 200 (fun (x, y) ->
    let hypot a b = a * a + b * b in
    let v = if ((hypot (x - 100) (y - 100)) < 1000) then (x + y) / 2 else 0 in
    { r = v; g = v; b = v })

let () = print_endline (Image.to_ppm image)
