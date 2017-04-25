
close all;
clear all;
clc; 

%% FILTRO DE PROMEDIO MÓVIL

% 1ra. Parte 
%
%    1- Generar un tren de pulsos cuadrados
%    2- Generar un ruido gaussiano (normnrd) media=0, varianza = 1
%    3- Sumar el ruido a la señal periódica

    ts = 0.5;    % Duracion del pulso en alto
    tamP = 100;  % Número de muestras en el pulso
    N = 10;      % Número de ciclos 
    
    senalMovil = 1;  % Inicializa
    
    for i = 1 : N
    
        un =ones(1, tamP);
        ce = zeros(1, tamP);
        
        senalMovil = [ senalMovil, un, ce ];
            
    end 
    
    senalMovilN = senalMovil( 2 : length( senalMovil ) );
    
    % Se determina el vector tiempo para el tren de pulsos
    tiempo = [ 0 : ts/( 2 * tamP ) : N * ts - ts / ( 2 * tamP ) ];
    
    figure( 1 )
    plot( tiempo, senalMovilN );
    
    
    % Genera ruido gaussiano (normnrd) media=0, varianza = 1
    ruido1 = normrnd( 1, 1, length( senalMovilN ) );   
    
    % Suma ruido a señal periódica
    senalCont = senalMovilN + ruido1( 1, : );  
    

    % Señal contaminada
    figure(2);
    plot( tiempo, senalCont );

    
% 2da. Parte 
%
%    Diseñar un filtro de promedio móvil para M = 5, 10, 25, 50

    % Filtro de promedio móvil
    M = 100;
    ac = 0;
    
    d = senalCont;
    
    for i = 1 : length( senalMovilN ) - ( M - 1)
        for j = 0 : M - 1
            
           ac = ac + d( i + j ); 
            
        end
        
        y( i ) = ac / M;
        ac = 0;
        
    end
    
    figure(3)
    plot( 1 : length( y ), y )
    
    
% 3ra. Parte
%
%    Hacer la 1ra y 2d parte pero con una señal de entrada cos(w0t)
        
     % Señal coseno, utiliza como vector a tiempo
     senalMovilN = cos( 2 * pi * tiempo );
     
    figure( 4 )
    plot( tiempo, senalMovilN );
    
    % Genera ruido gaussiano (normnrd) media=0, varianza = 1
    ruido1 = normrnd( 1, 1, length( senalMovilN ) );
    
    % Suma ruido a señal periódica
    senalCont = senalMovilN + ruido1( 1, : );
    
    % Señal contaminada
    figure( 5 );
    plot( tiempo, senalCont );
    
    % Filtro de promedio móvil
    Mc = 50;
    ac = 0;
    
    d = senalCont;
    
    for i = 1 : length( senalMovilN ) - ( Mc - 1 )
        for j = 0 : Mc - 1
            
           ac = ac + d( i + j ); 
            
        end
        
        y( i ) = ac / Mc;
        ac = 0;
        
    end
    
    figure( 6 )
    plot( 1 : length( y ), y )

    
  
%4ta. Parte
%
%   Graficar respuesta en frecuencia de cada filtro

     % Coeficientes del primer filtro
     coef1 = ones( 1, M ) / M;
     
     figure( 7 )
     freqz( coef1, 1 );
     
     % Coeficientes del segundo filtro
     coef2 = ones( 1, Mc ) / Mc;
     
     figure( 8 )
     freqz( coef2, 1 );
     


    
%   Conclusiones

     
