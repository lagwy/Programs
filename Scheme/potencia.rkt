#lang racket
; eleva una base a una potencia entera positiva
(define (^ a b)
  (if (zero? b)
      1
      (* a (^ a (- b 1)))))

; eleva una base a una potencia entera en versión terminal
(define (pot a b) (paux a b 1))
(define (paux a b r)
  (if (zero? b) r
      (paux a (- b 1) (* r a))))