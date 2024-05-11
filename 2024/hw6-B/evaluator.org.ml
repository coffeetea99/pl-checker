(*
 * SNU 4190.310 Programming Languages 2024 Spring
 * Lambda
 *)

exception Error of string

module StrSet = Set.Make (struct
  type t = string

  let compare = compare
end)

type substitution = (string * Lexp.t) list

let rec new_var_helper n var_set =
  let var_to_try = "#" ^ string_of_int n in
  if not (StrSet.mem var_to_try var_set) then var_to_try
  else new_var_helper (n + 1) var_set

let new_var recommend var_set =
  if not (StrSet.mem recommend var_set) then recommend
  else new_var_helper 0 var_set

let rec free_vars : Lexp.t -> StrSet.t = function
  | Var x -> StrSet.singleton x
  | Lam (x, e) -> StrSet.remove x (free_vars e)
  | App (e1, e2) -> StrSet.union (free_vars e1) (free_vars e2)

let rec subs ((var, var_exp) : string * Lexp.t) : Lexp.t -> Lexp.t = function
  | Var x as exp -> if var = x then var_exp else exp
  | Lam (x, e) as exp ->
      let open StrSet in
      let var_set = singleton var in
      let var_set = union var_set (free_vars var_exp) in
      let var_set = union var_set (free_vars exp) in
      let x' = new_var x var_set in
      let e' = subs (x, Var x') e in
      let e'' = subs (var, var_exp) e' in
      Lam (x', e'')
  | App (e1, e2) -> App (subs (var, var_exp) e1, subs (var, var_exp) e2)

let subst ((sub, exp) : substitution * Lexp.t) : Lexp.t =
  List.fold_left (fun acc sub_ele -> subs sub_ele acc) exp sub

let reduce (exp : Lexp.t) : Lexp.t = raise (Error "not implemented")
