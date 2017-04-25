function [suma0 suma1 sumaotro]=matriz33(A)
%encuentra los valores de 0 1 de una matriz y los cuenta
[m n]=size(A);% m filas n columnas
suma0=0;suma1=0;sumaotro=0;
for i=1:m
    for j=1:n
        if A(i,j)==0
            suma0=suma0+1;
        elseif A(i,j)==1
            suma1=suma1+1;
        else sumaotro=sumaotro+1;
        end
    end
end
suma1,suma0,sumaotro