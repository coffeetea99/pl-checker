(*
 * SNU 4190.310 Programming Languages 2024 Spring
 * Lambda
 *)

open Lambda

let rec inline : Lexp.t_let -> Lexp.t = function
  | LVar s -> Var s
  | LLam (s, e) -> Lam (s, inline e)
  | LApp (e1, e2) -> App (inline e1, inline e2)
  | Let (s, e1, e2) -> Evaluator.subs (s, inline e1) (inline e2)

let () =
  let pp = ref false in
  let src = ref "" in
  let _ =
    Arg.parse
      [ ("-pp", Arg.Set pp, "display parse tree") ]
      (fun x -> src := x)
      ("Usage: " ^ Filename.basename Sys.argv.(0) ^ " [-ptree] [file]")
  in
  let lexbuf =
    Lexing.from_channel (if !src = "" then stdin else open_in !src)
  in
  let pgm = inline (Parser.program Lexer.start lexbuf) in

  if !pp then (
    Lexp.pp pgm 0;
    print_newline ())
  else (
    print_string "=============\n";
    print_string "input program\n";
    print_string "=============\n";
    Pp.pp pgm;
    print_string "\n\n\n============\n";
    print_string "output program\n";
    print_string "=============\n";
    Pp.pp (Evaluator.reduce pgm);
    print_string "\n")
