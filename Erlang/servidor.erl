%servidor
-module(servidor).
-export([ciclo/0, cliente/2]).

cliente(Pid, Nombre) ->
	Pid ! {self(), Nombre},
	receive
		Respuesta -> Respuesta
	end.

ciclo() ->
	receive
		{De, Nombre} ->
			De ! Nombre, 
			ciclo();
	end.