#lang racket
; fibo terminal
(define (fibot n) (fibaux n 1 0))
(define (fibaux n a b)
  (if (eq? n 1) a
      (fibaux (- n 1) (+ a b) a )
      )
  )