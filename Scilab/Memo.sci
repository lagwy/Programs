clear

function Sistema(MATRIZ)

iReng = size(MATRIZ, 1)  // 1 = num de renglones
        iCol = size(MATRIZ, 2)  // 2 = num de columnas
        iPivAnt = 1
        iMax = 0
        iTemp = 0
 
        // Selecciono al pivote mayor posible
        for iI = 1 : iReng
            iMax = iI
 
            for iK = iI + 1 : iReng
                if (abs(MATRIZ(iMax, iI)) < abs(MATRIZ(iK, iI)))
                    iMax = iK
                end
            end
 
            for iJ = 1 : iCol
                iTemp = MATRIZ(iI, iJ)
                MATRIZ (iI, iJ) = MATRIZ(iMax, iJ)
                MATRIZ(iMax, iJ) = iTemp
            end
 
            for iK = 1 : iI - 1
                MATRIZ(iK, iK) = MATRIZ(iI, iI)
            end
 
            for iK = 1 : iReng
                if iI ~= iK
                    for iJ = iI + 1 : iCol
                        MATRIZ(iK, iJ) = (MATRIZ(iI, iI) * MATRIZ(iK, iJ) - MATRIZ(iK, iI) * MATRIZ(iI, iJ)) / iPivAnt
                    end
                end
            end
           
            for iK = 1 : iReng
                if iK ~= iI
                    MATRIZ(iK, iI) = 0
                end
            end
           
            iPivAnt = MATRIZ(iI, iI)
            disp(MATRIZ)
        end
       MATRIZ = MATRIZ / iPivAnt
       // Despliego la matriz
       disp(MATRIZ)
       
       // Despliego el vector resultante
       disp("Vector X: ")
       for (iK = 1 : iReng)
           disp(MATRIZ(iK, iCol))
       end
 
    endfunction


function Matrices(A)
    disp("el determinante es: ")
    disp(det(A))
    disp("la inversa es: ")
    disp(inv(A))
endfunction
/////////////// Programa principal ////////////////////////////////
disp("Que quieres hacer?")
disp("1.- Resolver sistema de ecuaciones.")
disp("2.- Obtener determinante e inversa")
opcion = input("Opción deseada: ")
n=input("Numero de ecuaciones? ")
    
    for i=1 : n
        for j = 1 : n
            A(i,j) = input("Valor de la matriz en " + string(i) + " , " + string(j)+": ")
    end
    end
    disp(A)

if opcion == 1 then
    disp("Vector B de la matriz: ")
    for i=1:n
       A(i,n+1) = input("Valor de la matriz en " + string(i) + " , " + string(n+1) +": ")
    end
    Sistema(A)
    
elseif opcion == 2 then
    Matrices(A)
    
else
    disp("Opcion incorrecta!")
end


