#lang racket
; patrón símetrico con n niveles de acoplamiento
(define (simetrico n)
  (simaux n n))

(define (simaux v n)
  (if (zero? n)
      (list )
        (list '< (simaux v (- n 1)) '> )))