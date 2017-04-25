%% Function coef_ak
%Funcion que calcula el coeficiente de la serier de fourier con la funcion
%
%           (2N1 + 1) / N,  k = 0, +-N, +-2N...
%   ak = 
%           1/N sin[k*pi*(2N1 + 1)/N] / sin(k*pi/N)       

function ak = coef_ak( k, N, dosN_1 )

    if mod( k, N ) == 0
        
        ak = dosN_1 / N;
        
    else
        
        ak = 1 / N * sin( k * pi * dosN_1 / N ) / sin( k * pi / N );
        
    end
    
end