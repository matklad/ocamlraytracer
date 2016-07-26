type t

type color = {
  r: int;
  g: int;
  b: int;
}



val create : int -> int -> ((int * int) -> color) -> t

val width : t -> int
val height : t -> int

val pixel_at : t -> int -> int -> color

val to_ppm : t -> string
