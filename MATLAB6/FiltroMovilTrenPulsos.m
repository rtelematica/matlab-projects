
close all;
clear all;
clc; 

%% FILTRO DE PROMEDIO M�VIL - TREN DE PULSOS CUADRADOS

% 1ra. Parte 
%
%    1- Generar un tren de pulsos cuadrados
%    2- Generar un ruido gaussiano (normnrd) media=0, varianza = 1
%    3- Sumar el ruido a la se�al peri�dica

    ts = 0.5;    % Duracion del pulso en alto
    tamP = 100;  % N�mero de muestras en el pulso
    N = 10;      % N�mero de ciclos 
    
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
    plot( tiempo, senalMovilN ), 
    title('Tren de Pulsos Cuadrados'),
    xlabel('n'),
    ylabel('Amplitud');
    
    % Genera ruido gaussiano (normnrd) media=0, varianza = 1
    ruido1 = normrnd( 0, 0.1, length( senalMovilN ) );   
    
%     figure(2)
%     plot( tiempo, ruido1 ),
%     title('Ruido Generado'),
%     xlabel('n'),
%     ylabel('Amplitud');
%     
    
    % Suma ruido a se�al peri�dica
    senalCont = senalMovilN + ruido1( 1, : );  
    

    % Se�al contaminada
%     figure(2);
%     plot( tiempo, senalCont ),
%     title('Tren de Pulsos Cuadrados Contaminado'),
%     xlabel('n'),
%     ylabel('Amplitud');
% 2da. Parte 
%
%    Dise�ar un filtro de promedio m�vil para M = 5, 10, 25, 50

    % Filtro de promedio m�vil
    M = 50;
    ac = 0;
    
    d = senalCont;
    
    for i = 1 : length( senalMovilN ) - ( M - 1)
        for j = 0 : M - 1
            
           ac = ac + d( i + j ); 
            
        end
        
        y( i ) = ac / M;
        ac = 0;
        
    end
    
    tiempo2 = tiempo( 1 : length(tiempo) - (M -1));
    figure( 3 )
    plot( tiempo2, y ),
    title('Tren de Pulsos contaminado, filtrado por filtro de promedio m�vil: M = 50'),
    xlabel('n'),
    ylabel('Amplitud');
    
   
   
  
%4ta. Parte
%
%   Graficar respuesta en frecuencia de cada filtro

     % Coeficientes del filtro
     coef1 = ones( 1, M ) / M;
     
%      figure( 4 )
%      freqz( coef1, 1 );
%      
 % 5ta. Parte  Ventanas
%
 
    % Se establece la venta a usar
    %ventana = hamming( 120 );
    %ventana = chebwin( 120 );
    ventana = nuttallwin( 120 );
%     
%     % Determinamos los coeficientes de la ventana
     coefVent = fir1( length( ventana ) - 1, 0.1, ventana );
%     
%     % Respuesta en frecuencia
%     figure( 5 )
%     freqz( coefVent, 1 );
%     
%     % Respuesta al impulso
%     figure( 6 )
%     impz( coefVent, 1 );
%     
%     % Plano complejo
%     figure( 7 )
%     zplane( coefVent, 1 );  
%     
    
% 6ta. Parte  Filtrado mediante ventanas
%    
    datosFiltrados = filter( coefVent, 1, senalCont );
    
    figure( 8 )
    plot( 1 : length(datosFiltrados), datosFiltrados ),
    title('Se�al tren de pulsos filtrado por un ventna Blackman-Harris con N = 120'),
    xlabel('n'),
    ylabel('Amplitud');

     
        