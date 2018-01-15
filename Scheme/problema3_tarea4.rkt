#lang racket
; Jorge Luis Márquez Sánchez A01139543
; Luis Ángel Martínez García A00813485
; Evert Salinas González     A00813642

; Grafo
(define g '((A ((B 2) (D 10)))
            (B ((C 9) (E 5)))
            (C ((A 12) (D 6)))
            (D ((E 7)))
            (E (( C 3)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Funcion que muestra los nodos destino de un nodo
(define (nodos-destino grafo nodo)
  (destino (destinos (d-origen nodo grafo))))


(define (destino grafo)
  (if (null? grafo) '()
      (cons (caar grafo) (destino (cdr grafo)))))

(define (destinos grafo)
  (if (null? grafo) '() (cadr grafo)))

(define (d-origen nodo grafo)
  (cond ((null? grafo) '())
        ((equal? (caar grafo) nodo) (car grafo))
        (else (d-origen nodo (cdr grafo)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Funcion que muestra los nodos origen de un nodo
(define (nodos-origen grafo nodo)
  (if (null? grafo) '()
      (if (esta? nodo (conectados grafo))
          (cons (caar grafo) (nodos-origen (cdr grafo) nodo))
          (nodos-origen (cdr grafo) nodo))))

; Funcion que comprueba que un nodo esta en el grafo
(define (esta? nodo grafo)
  ; Cuando no se encuentra en el grafo porque se llego a vaciar
  (if (null? grafo) #f
      ; Revisar si es el primer valor del grafo
      (if (equal? nodo (car grafo)) #t
          ; Revisar si esta en el resto del grafo
          (esta? nodo (cdr grafo)))))

; Funcion que revisa las conexiones que tiene el grafo
(define (conectados grafo)(nodos-destino grafo (caar grafo)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
