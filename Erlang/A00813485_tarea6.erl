% M_tarea.erl

% Cliente
% Repartidor
% Distribuidor
-module(A00813485_tarea6.erl ).

-export([comprar_refresco/3, cancelar_compra/2, crear_repartidor/4, surtir_siguiente/1, listar_clientes/1, parar_repartidor/1, crear_distribuidor/0, pid_repartidor/1, listar_repartidores/0, parar_distribuidor/0]).

crear_repartidor (Operador, Camion, {X, Y}, Cajas) ->
Repartidores = [Operador, Camion, {X, Y}, Cajas].