//  F
//  funcion de x
//  Parametros:
//    dX     Valor de x
//  Returna:
//    dy   el calculo de 1-e^(-x)
function dY = F(dX)
    dY = 1 - %e^(-dX)
endfunction

//  Trapecios
//  Integral por el método de trapecios
//  Parametros:
//     dA   es el limite inferior
//     dB   es el limite superior
//     iN   es el numero de trapecios
//  Regresa:
//    dSum   es la integral
function dSum = Integral(dA, dB, iN)
    // obtengo la h
    dH = (dB - dA) / iN
    // inicializo la suma
    dSum = 0
    // Calculo del primer valor de la sumatoria
    dSum = F(dA)
    // sumamos cada altura del lado izquierdo del rectangulo
    for iI = 2 : iN
        // Se suma dH al dA anterior
        dA = dA + dH
        // Se multiplica el valor de la función por 2
        dSum = dSum + 2*F(dA)
    end
    // Calculo del ultimo valor de la sumatoria
    dSum = dSum+F(dA + dH)
    // multiplico la suma por la H/2
    dSum = dSum * (dH/2)
endfunction

//   PROGRAMA PRINCIPAL
// pido los valores
dA = input("Da el limite inferior")
dB = input ("Da el limite superior")
// Comprobación de los límites
while dB < dA
    disp("Valores incorrectos.")
    dA = input("Da el limite inferior")
    dB = input ("Da el limite superior")
end

// Pido la cantidad de trapecios
iN = input("Cantidad de trapecios: ")
// Validación de que la cantidad sea válida
while iN < 1
    iN = input("Valor inválido. Cantidad de trapecios: ")
end
disp("Integral = " + string(Integral(dA, dB, iN)))

