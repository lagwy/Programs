#lang racket
; incrementa los números de una lista posiblemente imbricada
(define (incrementa lista)
  (cond ((null? lista) lista)
        ((number? (car lista))
         (cons (+ (car lista) 1) (incrementa (cdr lista))))
        (else (cons (incrementa (car lista))
                    (incrementa (cdr lista))))))