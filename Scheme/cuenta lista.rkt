#lang racket
; cuenta los atomos dentro de una lista posiblemente imbricada
(define (cuenta lista)
  (cond ((null? lista) 0) ; caso base
        ((list? (car lista))
         (+ (cuenta (car lista)) (cuenta (cdr lista))))
        (else (+ 1(cuenta (cdr lista))))))
               