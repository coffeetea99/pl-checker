/*
 * SNU 4190.310 Programming Languages 2024 Spring
 * K-- Interpreter
 */

%{
type declLet =
  | Val of string * K.exp
  | Fun of string * string * K.exp

let desugarLet: declLet * K.exp -> K.exp  =
 fun (l, e) ->
 	match l with
  | Val(x, e') -> K.LETV(x,e',e)
 	| Fun(f,x,e') -> K.LETF(f,x,e',e)
%}

%token UNIT
%token <int> NUM
%token TRUE FALSE
%token <string> ID
%token PLUS MINUS STAR SLASH EQUAL LB RB LBLOCK RBLOCK NOT COLONEQ SEMICOLON IF THEN ELSE END
%token WHILE DO FOR TO LET IN READ WRITE PROC
%token LP RP
%token EOF

%nonassoc IN
%left SEMICOLON
%nonassoc DO
%nonassoc THEN
%nonassoc ELSE
%right COLONEQ
%right WRITE
%left EQUAL LB
%left PLUS MINUS
%left STAR SLASH
%right NOT

%start program
%type <K.exp> program

%%

program:
    expr EOF { $1 }
  ;
expr:
    LP expr RP { $2 }
  | UNIT {K.UNIT}
  | MINUS NUM { K.NUM (-$2) }
  | NUM { K.NUM ($1) }
  | TRUE { K.TRUE }
  | FALSE { K.FALSE }
  | LP RP { K.UNIT }
  | ID { K.VAR ($1) }
  | ID LP expr RP { K.CALLV ($1, $3) }
  | expr PLUS expr { K.ADD ($1, $3) }
  | expr MINUS expr  {K.SUB ($1,$3) }
  | expr STAR expr { K.MUL ($1,$3) }
  | expr SLASH expr { K.DIV ($1,$3) }
  | expr EQUAL expr { K.EQUAL ($1,$3) }
  | expr LB expr { K.LESS ($1,$3) }
  | expr LB expr RB { match ($1,$3) with (K.VAR f, K.VAR x) -> K.CALLR (f, x) | _ -> raise Parsing.Parse_error}
  | NOT expr { K.NOT ($2) }
  | ID COLONEQ expr { K.ASSIGN ($1,$3) }
  | expr SEMICOLON expr { K.SEQ ($1,$3) }
  | IF expr THEN expr ELSE expr { K.IF ($2, $4, $6) }
  | WHILE expr DO expr { K.WHILE ($2, $4) }
  | FOR ID COLONEQ expr TO expr DO expr { K.FOR ($2, $4, $6, $8) }
  | LET decl IN expr { desugarLet($2, $4) }
  | READ ID { K.READ ($2) }
  | WRITE expr { K.WRITE ($2) }
  ;
decl:
    ID COLONEQ expr { Val ($1, $3) }
  | PROC ID LP ID RP EQUAL expr {Fun ($2, $4, $7)}
  ;
%%
