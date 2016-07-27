open Core_kernel.Std

type vector = (float * float * float)
type point = vector


let map f (x, y, z) = (f x, f y, f z)
let app (f1, f2, f3) (x, y, z) = (f1 x, f2 y, f3 z)

let zip_map f v1 v2 = app (map f v1) v2
let reduce f (x, y, z) = f x (f y z)

let i = (1.0, 0.0, 0.0)
let j = (0.0, 1.0, 0.0)
let k = (0.0, 0.0, 1.0)

let scale x = map (( *. ) x)


let add = zip_map (+.)
let sub = zip_map (-.)
let dot v1 v2 = zip_map ( *. ) v1 v2 |> reduce (+.)
let len v = dot v v |> sqrt

let cross
    (x, y, z)
    (a, b, c)

  = ( y *. c -. z *. b
    , z *. a -. x *. c
    , x *. b -. y *. a)

let padd = add
let pdiff = sub

let v_to_string (x, y, z) = Printf.sprintf "(%f, %f, %f)" x y z
let p_to_string (x, y, z) = Printf.sprintf "[%f, %f, %f]" x y z
