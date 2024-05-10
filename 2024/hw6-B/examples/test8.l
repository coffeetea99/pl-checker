let z' = \f.\z.z in
let p' = \n.\f.\z.f (n f z) in
let m' = \n.\f.\z.n(\g.\h.h (g f)) (\u.z) (\u.u) in

let t' = \m.\n.m in
let f' = \m.\n.n in

let a' = \m.\n.\f.\z.((m f) (n f z)) in
let x' = \m.\n.(m (a' n) z') in
let i' = \m.m (\n.f') t' in


let y'' = \f.((\x. f (x x))(\x. f (x x))) in
let f'' = \f.\n. (((i' n) (p' z')) (x' n (f (m' n)))) in

y'' f'' (p' (p' (p' (p' z'))))
