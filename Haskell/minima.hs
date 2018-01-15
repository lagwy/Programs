-- Minima
minima :: [(Integer,[Char],[Double])] -> [(Integer,[Char],Double)]
minima [] = []
minima ((x, nombre, lista):resto) = (x, nombre, minimum lista):minima resto
