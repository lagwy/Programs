#lang racket
(define (crearLista n)
  (if (= n 0) (list 0)                       
     (cons n (crearLista (- n 1)))))

(define (secuencia n)
  (reverse (crearLista n)))


