secuencia(0).
secuencia(N):-
		X is N-1,
		secuencia(X),
		write(N),
		nl.
		
