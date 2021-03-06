-module(problema1).
-export([test_hello/0, test_hello/2]).

test_hello() ->
   H = spawn(hello, hello,[]),
   test_hello(10, H).
test_hello(N, H) when N > 0 ->
   H ! {hello, self()},
   receive
       {reply, C} ->
           io:format("Received ~w~n", [C]),
           test_hello(N-1, H)
   end;
test_hello(_, _) ->
    io:format("My work is done").
