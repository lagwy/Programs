-- f_cuentasub
-- Problema 10
f_cuentasub:: [[Int]] -> [Int]
f_cuentasub l = map cuentaImpar l

cuentaImpar :: [Int] -> Int
cuentaImpar l = length [ x | x <- l, odd x ]
