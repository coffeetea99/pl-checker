(*
 * SNU 4190.310 Programming Languages 2024 Spring
 * Lambda
 *)

let rec inline : Lexp.t_let -> Lexp.t = function
  | LVar s -> Var s
  | LLam (s, e) -> Lam (s, inline e)
  | LApp (e1, e2) -> App (inline e1, inline e2)
  | Let (s, e1, e2) -> Evaluator.subs (s, inline e1) (inline e2)

let () =
  let src = ref "" in
  let _ =
    Arg.parse
      []
      (fun x -> src := x)
      ("Usage: " ^ Filename.basename Sys.argv.(0) ^ " [-ptree] [file]")
  in
  let lexbuf =
    Lexing.from_channel (if !src = "" then stdin else open_in !src)
  in
  let pgm = inline (Parser.program Lexer.start lexbuf) in
  let _ = Pp.pp (Evaluator.reduce pgm) in
  let _ = print_string "\n" in ()
