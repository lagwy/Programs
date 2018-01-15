clear
//////////////////////////////////////////////////////////
//
// SimpsonTercio.sci
//
// Programa que calcula la integral de la función 1-e^(-x) de un intervalo 
// y una n dados por el usuario.
//
// Autor: Luis Ángel Martínez García
// Matrícula: A00813485
// Fecha: 16/04/2015
///////////////////////////////////////////////////////////

//  F
//  funcion de x
//  Parametros:
//    dX     Valor de x
//  Returna:
//    dy   el calculo de 1-e^(-x)
function dY = F(dX)
    dY = 1 - %e^(-dX)
endfunction

//  Integral
//  Integral por el método de Simpson 1/3
//  Parametros:
//     dA   es el limite inferior
//     dB   es el limite superior
//     iN   valor de n
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
    for iI = 1: 2 : iN - 1
        dSum = dSum + 4*F(dA+iI*dH)
    end
    for iI = 2: 2 : iN - 2
        dSum = dSum + 2*F(dA+iI*dH)
    end

    // Calculo del ultimo valor de la sumatoria
    dSum = dSum+F(dB)
    // multiplico la suma por la H/3
    dSum = dSum * (dH/3)
endfunction

//   PROGRAMA PRINCIPAL
// pido los valores
dA = input("Da el limite inferior :")
dB = input ("Da el limite superior :")
// Comprobación de los límites
while dB < dA
    disp("Valores incorrectos.")
    dA = input("Da el limite inferior: ")
    dB = input ("Da el limite superior: ")
end

// Pido el valor de n
iN = input("Da el valor de n: ")
// Validación de que la cantidad sea válida
while iN < 0
    iN = input("Valor inválido. N = ")
end
while (modulo(iN, 2) <> 0) 
    iN = input("Debe ser un valor par. N = ")
end
disp("Integral = " + string(Integral(dA, dB, iN)))

