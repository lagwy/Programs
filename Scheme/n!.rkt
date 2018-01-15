#lang racket
(define (n! n)
  (if (zero? n)
      1
      (* n (n! (- n 1)))))

; recursividad terminal

(define (factorial n)
  (factorial-aux n 1))

(define (factorial-aux n r)
  (if (<= n 1) r
      (factorial-aux(- n 1)(* n r))))