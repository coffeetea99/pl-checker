open Sys
open Filename
open Evaluator

let rec inline : Lexp.t_let -> Lexp.t = function
  | LVar s -> Var s
  | LLam (s, e) -> Lam (s, inline e)
  | LApp (e1, e2) -> App (inline e1, inline e2)
  | Let (s, e1, e2) -> Evaluator.subs (s, inline e1) (inline e2)

let file2string f =
  let channel = open_in f in
  let content = really_input_string channel (in_channel_length channel) in
  close_in channel;
  content

let str2pgm str =
  let lexbuf = Lexing.from_string str in
  inline (Parser.program Lexer.start lexbuf)

let rec free_vars_mapping : Lexp.t -> string list = function
  | Var x -> [ x ]
  | Lam (x, e) -> List.filter (fun i -> i != x) (free_vars_mapping e)
  | App (e1, e2) ->
      let fv1 = free_vars_mapping e1 in
      let fv2 =
        List.fold_right
          (fun x acc -> List.filter (fun i -> i != x) acc)
          fv1 (free_vars_mapping e2)
      in
      fv1 @ fv2

let is_same file1 file2 =
  let pgm1 = str2pgm (file2string file1) in
  let pgm2 = str2pgm (file2string file2) in
  let free_vars1 = free_vars_mapping pgm1 in
  let free_vars2 = free_vars_mapping pgm2 in
  let pgm1 = List.fold_right (fun x acc -> Lexp.Lam (x, acc)) free_vars1 pgm1 in
  let pgm2 = List.fold_right (fun x acc -> Lexp.Lam (x, acc)) free_vars2 pgm2 in
  let rec is_same' (pgm1 : Lexp.t) (pgm2 : Lexp.t) =
    match (pgm1, pgm2) with
    | Var s1, Var s2 -> s1 = s2
    | Lam (s1, e1), Lam (s2, e2) ->
        if s1 = s2 then is_same' e1 e2
        else is_same' (subst ([ (s1, Var s2) ], e1)) e2
    | App (e11, e12), App (e21, e22) -> is_same' e11 e21 && is_same' e12 e22
    | _ -> false
  in
  is_same' pgm1 pgm2 && is_same' pgm2 pgm1

let () =
  let file1 = Sys.argv.(1) in
  let file2 = Sys.argv.(2) in
  if is_same file1 file2 then print_endline "Same"
  else print_endline "Different"
