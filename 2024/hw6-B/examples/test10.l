let n' = \b.\x.\y. ((b y) x) in
let a' = \b.\c.\x.\y. b (c x y) y in
let o' = \b.\c.\x.\y. b x (c x y) in
let t' = \x.\y. x in
let f' = \x.\y. y in
(a' (n' t') (n' f'))
