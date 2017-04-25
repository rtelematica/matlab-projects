function y=ifprueba13(A)
% prueba un vector con valores true false 
clc
if A
    disp('todos los elementos son verdaderos')
    y=sum(A)
    return
end
A(3)=true;
if A
    disp('se corrigio el tercer elemento')
    y=sum(A)
    return 
end
disp('el 2do elemento es falso')
y=9