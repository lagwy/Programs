-module(hello).
-export([hello/0, hello/1]).

hello() ->
	receive
		{hello, Pid} ->
			Pid ! {reply, 0},
			hello(1)
end.

hello(Contador) ->
	Aux = Contador + 1,
	receive
		{hello, Pid} ->
			Pid ! {reply, Aux},
			hello(Aux)
end.