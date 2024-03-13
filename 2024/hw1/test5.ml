(* Exercise 5. crazy3add *)
open Ex5
open Testlib

module TestEx5: TestEx =
  struct
    type testcase =
      | ADD of string * string * int

    let testcases =
      [ ADD ("0", "0", 0)
      ; ADD ("0", "+", 1)
      ; ADD ("0", "-", -1)
      ; ADD ("0", "*", 2)
      ; ADD ("0", "/", -2)
      ; ADD ("+", "0", 1)
      ; ADD ("+", "+", 2)
      ; ADD ("+", "-", 0)
      ; ADD ("+", "*", 3)
      ; ADD ("+", "/", -1)
      ; ADD ("-", "0", -1)
      ; ADD ("-", "+", 0)
      ; ADD ("-", "-", -2)
      ; ADD ("-", "*", 1)
      ; ADD ("-", "/", -3)
      ; ADD ("*", "0", 2)
      ; ADD ("*", "+", 3)
      ; ADD ("*", "-", 1)
      ; ADD ("*", "*", 4)
      ; ADD ("*", "/", 0)
      ; ADD ("/", "0", -2)
      ; ADD ("/", "+", -1)
      ; ADD ("/", "-", -3)
      ; ADD ("/", "*", 0)
      ; ADD ("/", "/", -4)
      ; ADD ("00", "0", 0)
      ; ADD ("00", "+", 1)
      ; ADD ("00", "-", -1)
      ; ADD ("00", "*", 2)
      ; ADD ("00", "/", -2)
      ; ADD ("++", "0", 4)
      ; ADD ("++", "+", 5)
      ; ADD ("++", "-", 3)
      ; ADD ("++", "*", 6)
      ; ADD ("++", "/", 2)
      ; ADD ("--", "0", -4)
      ; ADD ("--", "+", -3)
      ; ADD ("--", "-", -5)
      ; ADD ("--", "*", -2)
      ; ADD ("--", "/", -6)
      ; ADD ("**", "0", 8)
      ; ADD ("**", "+", 9)
      ; ADD ("**", "-", 7)
      ; ADD ("**", "*", 10)
      ; ADD ("**", "/", 6)
      ; ADD ("//", "0", -8)
      ; ADD ("//", "+", -7)
      ; ADD ("//", "-", -9)
      ; ADD ("//", "*", -6)
      ; ADD ("//", "/", -10)
      ; ADD ("/--*+0*++0", "+**//*00/+", 17183)
      ; ADD ("0-/+--/+/+", "00*/*0+*-0", 5640)
      ; ADD ("0---000*+-", "/0-+//*+//", -58262)
      ; ADD ("+**0----+/", "/00*-/**/+", -24142)
      ; ADD ("+0*/0+00*/", "-//0*-*000", -24684)
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

    let magic c =
      let t i=i*3 in let p i=t(i)+1 in let m i=t(i)-1 in let p2 i=t(i)+2 in let m2 i=t(i)-2 in
      let rec q c= match c with NIL->0|ZERO c'->t(q c')|ONE c'->p(q c')|MONE c'->m(q c')|TWO c'->p2(q c')|MTWO c'->m2(q c')
      in q c

    let runner tc =
      match tc with
      | ADD (c1, c2, ans) -> magic (crazy3add ((crazy3_of_string c1), (crazy3_of_string c2))) = ans

    let string_of_tc tc =
      match tc with
      | ADD (c1, c2, ans) ->
          ( Printf.sprintf "crazy3add(%s, %s)" c1 c2
          , string_of_int ans
          , string_of_int (magic (crazy3add ((crazy3_of_string c1), (crazy3_of_string c2))))
          )
  end

open TestEx5
let _ = wrapper testcases runner string_of_tc
