function divisor(numero)
%divisores de un numero
clc
divide=1;
while (divide<=numero)
    if(mod(numero,divide)==0)
        fprintf('%4i es divisor de %4i\n',divide,numero);
    end
    divide=divide+1
end