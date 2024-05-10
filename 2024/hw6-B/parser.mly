/*
 * SNU 4190.310 Programming Languages 2024 Spring
 * Lambda
 */

%token APP
%token LAMBDA DOT
%token <string> ID
%token IN
%token EQUAL
%token LET
%token LP RP
%token EOF

%nonassoc IN
%nonassoc DOT
%left ID LP
%left APP
%right EQUAL
%right LAMBDA

%start program
%type <Lexp.t_let> program

%%

program: exp EOF{ $1 }

exp:
	| ID { Lexp.LVar ($1) }
	| LAMBDA ID DOT exp { Lexp.LLam ($2, $4) }
	| LP exp RP { $2 }
	| exp exp %prec APP{ Lexp.LApp ($1, $2) }
	| LET ID EQUAL exp IN exp { Lexp.Let ($2, $4, $6) }
	;
%%
