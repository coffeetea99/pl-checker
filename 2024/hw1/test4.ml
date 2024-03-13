(* Exercise 4. crazy3val *)
open Ex4
open Testlib

module TestEx4: TestEx =
  struct
    type testcase =
      | CRAZY3 of string * int

    let testcases =
      [ CRAZY3 ("0", 0)
      ; CRAZY3 ("+", 1)
      ; CRAZY3 ("-", -1)
      ; CRAZY3 ("*", 2)
      ; CRAZY3 ("/", -2)
      ; CRAZY3 ("00", 0)
      ; CRAZY3 ("0+", 3)
      ; CRAZY3 ("0-", -3)
      ; CRAZY3 ("0*", 6)
      ; CRAZY3 ("0/", -6)
      ; CRAZY3 ("+0", 1)
      ; CRAZY3 ("++", 4)
      ; CRAZY3 ("+-", -2)
      ; CRAZY3 ("+*", 7)
      ; CRAZY3 ("+/", -5)
      ; CRAZY3 ("-0", -1)
      ; CRAZY3 ("-+", 2)
      ; CRAZY3 ("--", -4)
      ; CRAZY3 ("-*", 5)
      ; CRAZY3 ("-/", -7)
      ; CRAZY3 ("*0", 2)
      ; CRAZY3 ("*+", 5)
      ; CRAZY3 ("*-", -1)
      ; CRAZY3 ("**", 8)
      ; CRAZY3 ("*/", -4)
      ; CRAZY3 ("/0", -2)
      ; CRAZY3 ("/+", 1)
      ; CRAZY3 ("/-", -5)
      ; CRAZY3 ("/*", 4)
      ; CRAZY3 ("//", -8)
      ; CRAZY3 ("0/+", 3)
      ; CRAZY3 ("+*0-", -20)
      ; CRAZY3 ("+*+-**+++-", -9569)
      ; CRAZY3 ("*0+++**-/*", 26120)
      ; CRAZY3 ("+/++-/+0+-", -12929)
      ; CRAZY3 ("/00*-+*+**", 56347)
      ; CRAZY3 ("-00/0+0/-*", 28619)
      ; CRAZY3 ("+0+0--/*+0", 9163)
      ; CRAZY3 ("-/-++-*/++", 23177)
      ; CRAZY3 ("+/0+*0/00*", 38092)
      ; CRAZY3 ("--0*0*0/**", 48650)
      ; CRAZY3 ("*--/*/-00*", 38249)
      ]

    let crazy3_of_string str =
      let rec crazy3_of_char_list l =
        match l with
        | [] -> NIL
        | h::t ->
            if h = '0' then ZERO (crazy3_of_char_list t)
            else if h = '+' then ONE (crazy3_of_char_list t)
            else if h = '-' then MONE (crazy3_of_char_list t)
            else if h = '*' then TWO (crazy3_of_char_list t)
            else if h = '/' then MTWO (crazy3_of_char_list t)
            else failwith "only '0+-*/' are allowed"
      in crazy3_of_char_list (List.rev (char_list_of_string str))

    let runner tc =
      match tc with
      | CRAZY3 (str, ans) -> crazy3val (crazy3_of_string str) = ans

    let string_of_tc tc =
      match tc with
      | CRAZY3 (str, ans) -> ("crazy3val " ^ str, string_of_int ans, string_of_int (crazy3val (crazy3_of_string str)))
  end

open TestEx4
let _ = wrapper testcases runner string_of_tc
