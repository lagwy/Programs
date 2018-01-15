% calcula el factorial
-module(fact).
-export([factorial/1]).


% unicamente la última definición lleva . 
% todas las demás llevan ;
% por cuestiones de eficiencia, el caso base debería ir después, ya que se evaluaría siempre N+1 veces
factorial (N) when N > 0 -> N * factorial(N-1);
factorial(0) -> 1. % el caso base solo se ejecuta una vez


% 1> fact:factorial(5).