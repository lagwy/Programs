#lang racket
; Agregar un renglon
(define (add-ren lista1 lista2)
  (if (null? lista1) (list lista2)
      (list lista1 lista2)
      ))