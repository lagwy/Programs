#lang racket
; anida N veces el valor N
(define (anida-nveces n)
  (anida-aux n n))

(define (anida-aux v n)
  (if (zero? n)
      (list v)
      (list (anida-aux v (- n 1)))))