all: run

run: lexer.cmo parser.cmo machine.cmo k.cmo translator.cmo pp.cmo main.cmo
	ocamlc -o run lexer.cmo pp.cmo parser.cmo machine.cmo translator.cmo k.cmo main.cmo

k.cmo : k.ml
	ocamlc -c k.ml

machine.cmo : machine.ml
	ocamlc -c machine.ml

translator.cmo : translator.ml k.cmo machine.cmo
	ocamlc -c translator.ml

pp.cmo : pp.ml translator.cmo
	ocamlc -c pp.ml

parser.ml: parser.mly translator.cmo
	ocamlyacc parser.mly

parser.mli: parser.mly
	ocamlyacc parser.mly

parser.cmi: parser.mli
	ocamlc -c parser.mli

parser.cmo: parser.ml parser.cmi
	ocamlc -c parser.ml

main.cmo : translator.cmo main.ml
	ocamlc -c main.ml

lexer.cmo: lexer.ml
	ocamlc -c lexer.ml

lexer.ml: lexer.mll parser.cmo
	ocamllex lexer.mll

clean:
	rm -f *.cmx *.cmi parser.mli parser.ml lexer.ml run *.o *.cmo gc stdout_redirect.txt
