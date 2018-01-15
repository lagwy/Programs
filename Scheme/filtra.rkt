#lang racket
; FOS que elimina de una lista los elementos que no
; cumplan con un predicado enviado como segundo parametro
(define filtra
  (lambda (l func)
    (if (null? l) '()
        (if (func (car l))
            (cons (car l) (filtra (cdr l) func))
            (filtra (cdr l) func)))))