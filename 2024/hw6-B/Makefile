all: run

run: lexer.cmo parser.cmo evaluator.cmo lexp.cmo pp.cmo main.cmo
	ocamlc -o run lexer.cmo pp.cmo parser.cmo evaluator.cmo lexp.cmo main.cmo

comparer: lexer.cmo parser.cmo evaluator.cmo lexp.cmo pp.cmo comparer.cmo
	ocamlc -o comparer lexer.cmo pp.cmo parser.cmo evaluator.cmo lexp.cmo comparer.cmo

lexp.cmo : lexp.ml
	ocamlc -c lexp.ml

evaluator.cmo : evaluator.ml lexp.cmo
	ocamlc -c evaluator.ml

pp.cmo : pp.ml lexp.cmo
	ocamlc -c pp.ml

parser.ml: parser.mly evaluator.cmo
	ocamlyacc parser.mly

parser.mli: parser.mly
	ocamlyacc parser.mly

parser.cmi: parser.mli
	ocamlc -c parser.mli

parser.cmo: parser.ml parser.cmi
	ocamlc -c parser.ml

main.cmo : evaluator.cmo main.ml
	ocamlc -c main.ml

comparer.cmo : evaluator.cmo comparer.ml
	ocamlc -c comparer.ml

lexer.cmo: lexer.ml
	ocamlc -c lexer.ml

lexer.ml: lexer.mll parser.cmo
	ocamllex lexer.mll

clean:
	rm -f *.cmx *.cmi parser.mli parser.ml lexer.ml run comparer *.o *.cmo stdout_redirect.txt
