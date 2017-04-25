%% Funcion de la serie de fourier mediante la expresion general
% Funcion que pide como parametro N, 2N + 1 y numero de periodos a mostrar,
% y retorna el vecto ak y a su vector de frecuencias

function [f_ak, ak] = SDF_1( N, dosN_1, periodo )

    funN = N;
    funDosN_1 = dosN_1;
    funPeriodo = periodo;

    a = 0;
    i = 1;
    
    for k = - funN * funPeriodo : funN * funPeriodo
  
        if mod( k, funN) == 0
        
            a( i ) = funDosN_1 / funN;
        
        else
       
            a( i ) = 1 / funN * sin( k * pi * funDosN_1 / funN ) / sin( k * pi / funN );
        end
    
            i = i + 1;
    
    end

    ak = a;
    f_ak = - funN * funPeriodo : funN * funPeriodo;
end


