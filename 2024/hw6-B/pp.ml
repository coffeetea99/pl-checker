(*
 * SNU 4190.310 Programming Languages 2024 Spring
 * Lambda
 *)

open Lexp

let rec pp = function
  | Var s -> print_string s
  | Lam (s, e) ->
      print_string "\\";
      print_string (s ^ ".");
      pp e;
      print_string ""
  | App (e1, e2) ->
      print_string "(";
      pp e1;
      print_string ") (";
      pp e2;
      print_string ")"
