open Base
open Stdio

let rec fibonacci n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | x -> (fibonacci (x-1) + fibonacci (x-2))

let () = printf "%i\n" (fibonacci 7)


let fast_fib n =
  let rec helper n prev pprev =
    match n with
    | 1 -> prev
    | x -> helper (x-1) prev (pprev + prev)
  in
  helper n 0 1
