#lang racket
; FOS que recibe dos funcione como argumentos
; y regresa una funcion que aplique la composicion de funciones a un valor x
(define compon2
  (lambda (f g)
    (lambda (x)
      (f (g x)))))