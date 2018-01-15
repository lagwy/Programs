clear

function dY = Lagrange(dArrX, dArrY, dX)
    if(length(dArrX) == length(dArrY))
        dY = 0
        for iI = 1 : length(dArrX)
            L = 1
            for iJ = 1 : length(dArrY)
                if iI <> iJ then
                    L = L * ((dX - dArrX(iJ)) / (dArrX(iI) - dArrX(iJ)))
                end                
            end
            dY = dY + L*dArrY(iI)
        end
    else 
        dY="Error no son de la misma longitud"
    end
endfunction

function [P] = lagrange(X, Y) //X nodes, Y values; P is the numerical Lagrange polynomial interpolation
    n=length(X);//n is the number of nodes. (n-1) is the degree
    x = poly(0, "x"); 
    for i = 1; n, L=1;
        for j=[1:i-1,i+1:n]
            L=L*
    end
endfunction

////////////////////Programa Principal ///////////////////////////////7
ArrX = [1 2 5]
ArrY = [5 12 10]
disp(Lagrange(ArrX, ArrY, 1))
disp(Lagrange(ArrX, ArrY, 3))
disp(Lagrange(ArrX, ArrY, 5))
