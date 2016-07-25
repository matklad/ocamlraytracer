let image = let open Image in create 20 20 (fun (x, y) ->
    let hypot a b = a * a + b * b in
    let v = if ((hypot (x - 5) (y - 5)) < 10) then 255 else 0 in
    { r = v; g = v; b = v })

let () =
  for y = 0 to Image.height image do
    for x = 0 to Image.width image do
      let color = if (Image.pixel_at image x y).Image.r < 10 then '.' else 'X' in
      print_char color
    done;
    print_newline ()
  done
