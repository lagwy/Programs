(define (rectangulo base altura propiedad) (if propiedad==(quote perimetro) base+base+altura+altura (if propiedad==(quote area) base*altura (if propiedad==(quote diagonal) (sqrt ( + (* base base)(* altura altura)) (quote invalido))))))