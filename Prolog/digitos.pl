digito(N ,R):- N < 10, R is 1.
digito(N ,R):- N < 100, N > 9, R is 2.
digito(N ,R):- N < 1000, N > 99, R is 3.
digito(N ,R):- N < 10000, N > 999, R is 4.
digito(N ,R):- N < 100000, N > 9999, R is 5.
digito(N ,R):- N < 1000000, N > 99999, R is 6.
digito(N ,R):- N < 10000000, N > 999999, R is 7.
digito(N ,R):- N < 100000000, N > 9999999, R is 8.
digito(N ,R):- N < 1000000000, N > 99999999, R is 9.
digitos(N, V):- digito(N, V).