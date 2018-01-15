#lang racket
; Map y Apply si regresan

; Suma los elementos de la lista
(apply +'(3 5 7 1))

; Suma los elementos de la lista recursivamente
(define (suma lista)
  (if (null? lista)
      0
      (+ (car lista) (suma (cdr lista)))))

; Suma uno a un numero
(map add1 '(1 2 3))

; Mostrar la primer columna de una matriz
(map car '((1 2 3)(4 5 6)(7 8 9)))

; Suma del primer renglon de una matriz
(apply +(car '((1 2 3)(4 5 6)(7 8 9))))

; (map cadr bdatos) en donde bdatos tiene la matriz de (nomina (nombre) #depto sueldo)
; (apply +(map cadddr bdatos)) hace la suma de los sueldos

; Sumatoria de todos los elementos de una matriz (recursivo)
(define (sumatoria matriz)
  (cond ((null? matriz) 0)
        (else (+ (apply + (car matriz))
                 (sumatoria (cdr matriz))))))
(define sumam (lambda (m) (apply + (map suma m))))