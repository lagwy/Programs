-- Ejercicios del 04 de marzo

-- Calcula el siguiente entero
sucesor :: Integer -> Integer 
sucesor x = x + 1

-- suma de numeros
suma :: Integer -> Integer -> Integer
suma x y = x + y

-- suma de cuadrados
sumacuadrados :: Int -> Int -> Int
sumacuadrados x y = x * x + y * y

-- Recursion, calculo de factorial ya que Haskell no tiene ciclos
factorial :: Int -> Int
factorial 0 = 1 -- Caso base: solucion directa
factorial n = n * factorial (n - 1) -- Caso general: llamada recursiva

-- Listas 
-- Se representan como [2,4,3,5]
-- head y tail son como car y cdr de Scheme
car :: [a] -> a -- Regresa un tipo a que es del mismo tipo que los elementos de la lista
car (x:lista) = x -- Lo recomendado seria utilizar una variable anonima en lugar de lista

cdr :: [a] -> [a]
cdr (_:xs) = xs -- Variable anonima cuando no nos interese algun valor

-- Polimorfismo de tipo, existe length
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- En Haskell los strings son listas de caracteres ['h','o','l','a']
posint :: Int -> [Int] -> Int
posint _ [] = error "Entero no encontrado"
posint x (y:lista) = 
	if x == y then 1
		else 1 + posint x lista

-- Constantes
mipi = 3.1416

-- Case
-- Obten el primer elemento de una lista
carv :: [a] -> a
carv xs = case xs of
	[] -> error "Lista vacia!"
	(x:_) -> x


-- Para extraer un elemento de una lista [1,2,3,4,5] !! 3 regresa 4
-- Para construir listas 1:2:3:[]
-- Para ver el resultado se pone set 
-- Para revisar si una lista esta vacia null []