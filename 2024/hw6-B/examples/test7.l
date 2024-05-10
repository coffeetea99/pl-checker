let z = \f.\z.z in
let o = \f.\z.(f z) in
let a = \m.\n.\f.\z.((m f) (n f z)) in
let x = \m.\n.(m (a n) z) in
(x (a o o) (a o o))