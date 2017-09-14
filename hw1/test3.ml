(* Exercise 3. iter *)
open Ex3
open Testlib

type testcase =
    | INT of int * (int -> int) * int * int
    | STRING of int * (string -> string) * string * string
    | FLOAT of int * (float -> float) * float * float
    | BOOL of int * (bool -> bool) * bool * bool

let runner (tc: testcase): bool =
    match tc with
    | INT(n, f, x, o) -> iter (n,f) x = o
    | STRING(n, f, x, o) -> iter (n,f) x = o
    | FLOAT(n, f, x, o) -> iter (n,f) x = o
    | BOOL(n, f, x, o) -> iter (n,f) x = o

let rec run tcs correct total =
    match tcs with
    | [] -> print_endline (string_of_frac correct total)
    | tc::tcs' ->
            let cor = runner tc in
            let () = print_endline (res_string cor (total+1))
            in if cor then run tcs' (correct+1) (total+1)
                else run tcs' correct (total+1)

let testcases: testcase list =
    [ INT (10, (fun x -> x+1), 0, 10)
    ; STRING (10, (fun x -> x ^ "a"), "", "aaaaaaaaaa")
    ; INT (10, (fun x -> x*2), 1, 1024)
    ; INT (0, (fun x -> x*x+x), 1234, 1234)
    ; BOOL (123, (fun x -> not x), true, false)
    ]

let () = print_endline "# Test Exercise 3"
let () = run testcases 0 0
