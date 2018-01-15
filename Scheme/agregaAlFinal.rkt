#lang racket
; FOS que toma un elemento e y regresa una funcion que toma una lista
; y agrega e al final de la lista
(define agregaAlFinal
  (lambda (l1)
    (lambda (l2)
      (append l2 (list l1)))))