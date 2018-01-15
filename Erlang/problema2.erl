-module(problema2).
-export([ciclo/2, inicio/0]).

inicio() ->
	Pid = spawn(problema2, ciclo, [0,0]),
	Pid ! {plus, 3 , 5},
	Pid ! {mul, 3, 5},
	Pid ! {last, Pid},
	Pid ! {sum, Pid}.

ciclo(L, S) ->
receive
	{plus, X, Y} ->
		io:format("Suma = ~p~n", [X + Y]),
		ciclo(X + Y, S + X + Y);
	{mul, X, Y} ->
		io:format("Multiplicacion = ~p~n", [X * Y]),
		ciclo(X * Y, S + X * Y);
	{last, P} ->
		P ! L,
		ciclo(L, S);
	{sum, P} ->
		P ! S,
		ciclo(L,S)
end.

%	{last, P}		send a message of the form {result, L} to process P. L should be the last value computed.
%	{sum, P}		send a message of the form {result, S} to process P. S should be the sum of all computed values.
