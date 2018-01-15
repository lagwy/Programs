#lang racket
; subebaja despliega los numeros de 1 al N al 1
(define (subebaja n) (sbaux n 1))
(define (sbaux n r)
  (display " ")
  (display r)
  (if (< r n) (sbaux n (+ r 1)) (display ""))
  (if (not(eq? n r)) (and (display " ") (display r)) (display "")))