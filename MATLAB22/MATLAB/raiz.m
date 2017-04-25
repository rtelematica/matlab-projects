
%% Practica 4. "Ecuaciones de Diferencias y Sistemas Recursivos y no Recursivos"
function y=raiz(a)

Y_A = a;

dif = 0.01;

for i = 0 : 1000
    
    Y = (1/2)*(Y_A + a / Y_A)
    
    if (Y - Y_A) >= dif
        break;
    end;
    
    Y_A = Y;
    
    return raiz()
end
    

    x = Y