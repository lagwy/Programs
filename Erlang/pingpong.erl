-module(pingpong).
-export([inicio/0, ping/2, pong/0]).
ping(0, Pong_PID) ->
Pong_PID ! terminado,
io:format("Ping termino~n", []);
ping(N, Pong_PID) ->
Pong_PID ! {ping, self()},
receive
pong -> io:format("Ping recibe pong~n", [])
end,
ping(N - 1, Pong_PID).
pong() ->
receive
terminado -> io:format("Pong termino~n", []);
{ping, Ping_PID} ->
io:format("Pong recibio ping~n", []),
Ping_PID ! pong,
pong()
end.
inicio() ->
Pong_PID = spawn(pingpong, pong, []),
spawn(pingpong, ping, [3, Pong_PID]).

%pingpong:inicio().
