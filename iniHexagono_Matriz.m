%%Inicializaci�n de Matrices
% y - n�mero de filas
% x - n�mero de columnas 
function z = iniHexagono_Matriz(x, y)

    zz = 0;

    for j = 1 : y
        for i = 1 : x
            
            zz(j,i) = 0;
            
        end
    end
   z = zz;
end