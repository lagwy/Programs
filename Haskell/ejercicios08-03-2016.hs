promalum :: Integer -> [(Integer,[Char], [Double])] -> Double
promalum _ [] = 0.0
promalum mat1 ((mat2, _ , parcialista) : resto) = 
	if mat1 == mat2 then
		sum parcialista / fromIntegral (length parcialista)
	else promalum mat1 resto

-- Tipos definidos por el usuario
-- Declaración por medio de la palabra reservada data
-- Ejemplo del propio tipo de dato booleano
data Boleano = Falso | Verdadero deriving Show
data Color = Rojo | Verde | Azul deriving Show
data Punto a = Pt a a  

-- Arboles binarios
data Arbol e = Nodo (Arbol e) e (Arbol e) | ArbolVacio

-- Listas anidadas
data ListaAnidada a = Elemento a | Lista [ListaAnidada a]