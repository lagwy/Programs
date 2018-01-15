menor :: [Int] -> Int -> [Int]
menor [] _ = []
menor l a = filter (<a) l

menores :: [Int] -> [Int] -> [Int]
menores [] _ = []
menores _ [] = []
menores (x : xs) lista = menor lista x ++ menores xs lista