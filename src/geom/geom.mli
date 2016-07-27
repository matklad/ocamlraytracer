type vector
type point

val i : vector
val j : vector
val k : vector

val scale : float -> vector -> vector

val add : vector -> vector -> vector
val sub : vector -> vector -> vector
val dot : vector -> vector -> float
val len : vector -> float

val cross : vector -> vector -> vector

val padd : point -> vector -> point
val pdiff : point -> point -> vector

val v_to_string : vector -> string
val p_to_string : point -> string
