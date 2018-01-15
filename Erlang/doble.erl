% eleva un valor al doble
-module(doble).
-export([doble/1]).
doble(X) -> 2 * X.


% se compila con c(double).
% se ejecuta doble:doble(6).