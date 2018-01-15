#lang racket
(define (mayor lista)
  (cond
    ((= (length lista ) 0) "Lista vacia")
    ((= (length lista) 1) (car lista))
    (else (max (car lista) (mayor (cdr lista))))
  )
)

(define (mayor2 lista)
  (let ((primero (car lista))
        (resto (cdr lista)))
    (if (null? resto)
        primero
        (let ((maxr (mayor resto)))
          (if (> primero maxr)
              primero
              maxr)))))



