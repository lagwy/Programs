clear
/////////////////////////////////////////////////////////////////////
// Polinomio.sci
//
// Programa que lee un polinomio, evalúa y calcula raíces.
//
// Autor: Luis Ángel Martínez García
// Matrícula: A00813485
// Fecha: 09/03/2015
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// PedirPolinomio
//
// Función que pide y despliega los valores del polinomio.
// 
// Parametros:
//  Ninguno
// Regresa:
//  Polinomio    Vector construido a partir de los valores dados
/////////////////////////////////////////////////////////////////////
function Polinomio = PedirPolinomio()
    //Pido el grado del polinomio
    iGrado = input("Grado de polinomio: ")
    //Verificación del grado
    while iGrado < 0
        iGrado = input("Grado incorrecto. Nuevo grado: ")
    end
    //Guardo los valores en un vector
    for iI = 1 : iGrado + 1
        iPolinomio(iI) = input("Coeficiente " + string(iI-1) + " : ")
    end
    Polinomio = poly(iPolinomio,"x","coeff")
    //Desplegar polinomio
    disp(Polinomio)
endfunction


/////////////////////////////////////////////////////////////////////
// Evaluar
//
// Función que evalúa un valor en el polinomio dado en la opción 1
//
// Parametros:
//  Polinomio   Polinomio en el que se evaluarán los valores
// Regresa:
//  Nada
/////////////////////////////////////////////////////////////////////
function Evaluar(Polinomio)
    //Valor para el cual se evaluará el polinomio
    iValor = input("Valor: ")
    //Despliego el cálculo
    disp(horner(Polinomio, iValor))
endfunction


/////////////////////////////////////////////////////////////////////
// Raices
//
// Función que calcula las raíces del polinomio dado en la opción 1
//
// Parametros:
//  Polinomio   Polinomio del cual se calcularán las raíces
// Regresa:
//  Nada
/////////////////////////////////////////////////////////////////////
function Raices(Polinomio)
    //Despliego las raíces del polinomio
    disp(roots(Polinomio))
endfunction


/////////////////////////////////////////////////////////////////////
// Menu
//
// Función que despliega el menú del programa
//
// Parametros:
//  Ninguno
// Regresa:
//  Nada
/////////////////////////////////////////////////////////////////////
function Menu()
    disp("Menu del programa Polinomio.sci")
    disp(" 1. Definicion de un polinomio")
    disp(" 2. Evaluacion de polinomio")
    disp(" 3. Obtencion de las raices")
    disp(" 4. Salir")
endfunction

////////////////////////// PROGRAMA PRINCIPAL /////////////////////////
//Inicializo las variables que serán utilizadas en el programa
iOpcion = 0
Polinomio = 0
//Mientras la opción sea diferente a salir
while iOpcion <> 4
    //Despliego el menú
    Menu()
    //Pido la opción
    iOpcion = input("Opcion deseada: ")
    if iOpcion == 1 then
        Polinomio = PedirPolinomio()
    elseif iOpcion == 2 then
        Evaluar(Polinomio)
    elseif iOpcion == 3 then
        Raices(Polinomio)  
    elseif iOpcion == 4 then
        disp("Hasta la vista Baby!")
    else
        disp("opcion Erronea")
    end
end

