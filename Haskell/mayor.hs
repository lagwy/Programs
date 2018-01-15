-- mayor de una lista
mayor :: [Int] -> Int
mayor [] = error "Lista vacia!"
mayor [x] = x
mayor (x:resto) = 
	if x > mayor resto then x
		else mayor resto