
%% Tarea filtro butter, cheby1 y cheby2

% Diseñar los siguientes filtros:

%  Butterworth de tercer y sexto orden con una frecuencia de corte de 0.2
%  Chebyshev 1 y 2 de tercer y sexto orden con una frecuencia de corte de
%  0.2. En estos casos, variar el valor de R para ver los rizados.

    wn = 0.2;

%  Butterworth : Orden 3
    [ bButt3, aButt3 ] = butter( 3, wn );

%  Butterworth : Orden 3
    [ bButt6, aButt6 ] = butter( 6, wn );

    R = 1; %10, 20, 25;

%  Chebyshev 1 : Orden 3
    [ bC1_3, aC1_3 ] = cheby1( 3, R, wn );

%  Chebyshev 1 : Orden 6
    [ bC1_6, aC1_6 ] = cheby1( 6, R, wn );

%  Chebyshev 2 : Orden 3
    [ bC2_3, aC2_3 ] = cheby2( 3, R, wn );

%  Chebyshev 2 : Orden 6
    [ bC2_6, aC2_6 ] = cheby2( 6, R, wn );


% Para cada filtro 
%  Graficar respuesta al impulso, respuesta en frecuencia y diagrma de
%  polos y ceros. Describir el comprotamiento de los filtros.

%  Respuesta al impulso

    figure( 1 )
    subplot( 2, 1, 1 ), impz( bButt3, aButt3 ), 
    title( 'Respuesta al impulso de un filtro Butterworth de orden 3' )
   
    subplot( 2, 1, 2), impz( bButt6, aButt6 ), 
    title( 'Respuesta al impulso de un filtro Butterworth de orden 6' )
    
    figure( 2 )
    subplot( 2, 1, 1 ), impz( bC1_3, aC1_3 ), 
    title( 'Respuesta al impulso de un filtro Chebyshev 1 de orden 3' )
    
    subplot( 2, 1, 2 ), impz( bC1_6, aC1_6 ), 
    title( 'Respuesta al impulso de un filtro Chebyshev 1 de orden 6' )   
 
    figure( 3 )
    subplot( 2, 1, 1 ), impz( bC2_3, aC2_3 ), 
    title( 'Respuesta al impulso de un filtro Chebyshev 2 de orden 3' )
    
    subplot( 2, 1, 2 ), impz( bC2_6, aC2_6 ), 
    title( 'Respuesta al impulso de un filtro Chebyshev 2 de orden 3' )
  

%  Respuesta en frecuencia
    figure( 4 )
    freqz( bButt3, aButt3 ), 
    title( 'Respuesta en frecuencia de un filtro Butterworth de orden 3' )
   
    figure( 5 )
    freqz( bButt6, aButt6 ), 
    title( 'Respuesta en frecuencia de un filtro Butterworth de orden 6' )
   
    figure( 6 )
    freqz( bC1_3, aC1_3 ), 
    title( 'Respuesta en frecuancia de un filtro Chebyshev 1 de orden 3' )
   
    figure( 7 )
    freqz( bC1_6, aC1_6 ), 
    title( 'Respuesta en frecuencia de un filtro Chebyshev 1 de orden 6' )

    figure( 8 )
    freqz( bC2_3, aC2_3 ), 
    title( 'Respuesta en frecuancia de un filtro Chebyshev 2 de orden 3' )
    
    figure( 9 )   
    freqz( bC2_6, aC2_6 ), 
    title( 'Respuesta en frecuancia de un filtro Chebyshev 2 de orden 6' )
  
   
%  Diagrama de polos y ceros

    figure( 10 )
    zplane( bButt3, aButt3 ), 
    title( 'Constelación de polos y ceros de un filtro Butterworth de orden 3' )
    
    figure( 11 )
    zplane( bButt6, aButt6 ), 
    title( 'Constelación de polos y ceros de un filtro Butterworth de orden 6' )
    
    figure( 12 )
    zplane( bC1_3, aC1_3 ), 
    title( 'Constelación de polos y ceros de un filtro Chebyshev 1 de orden 3' )
    
    figure( 13 )
    zplane( bC1_6, aC1_6 ), 
    title( 'Constelación de polos y ceros de un filtro Chebyshev 1 de orden 6' )   

    figure( 14 )
    zplane( bC2_3, aC2_3 ), 
    title( 'Constelación de polos y ceros de un filtro Chebyshev 2 de orden 3' )
    
    figure( 15 )   
    zplane( bC2_6, aC2_6 ), 
    title( 'Constelación de polos y ceros de un filtro Chebyshev 2 de orden 6' )
   

% Filtrar las señales de la practica anterior. Gráficar la señales
% filtradas. Comparar los resultados con los obtenidos en la práctica
% anterior.

% Señal coseno:
    
    ts = 0.5;    % Duracion del pulso en alto
    tamP = 100;  % Número de muestras en el pulso
    N = 10;      % Número de ciclos 

    tiempo = [ 0 : ts/( 2 * tamP ) : N * ts - ts / ( 2 * tamP ) ];
        
    % Señal coseno, utiliza como vector a tiempo
    senalFiltradaC = cos( 2 * pi * tiempo );
    
    figure( 16 )
    plot( tiempo, senalFiltradaC ),
    title('Función Coseno'),
    xlabel('n'),
    ylabel('Amplitud');
    
% Señal Tren de Pulsos Cuadrados

    senalFiltradaT = 1;  % Inicializa
    
    for i = 1 : N
    
        un =ones(1, tamP);
        ce = zeros(1, tamP);
        
        senalFiltradaT = [ senalFiltradaT, un, ce ];
            
    end 
    
    senalFiltradaT2 = senalFiltradaT( 2 : length( senalFiltradaT ) );
   
    figure( 17 )
    plot( tiempo, senalMovilN ), 
    title('Tren de Pulsos Cuadrados'),
    xlabel('n'),
    ylabel('Amplitud');

    
% Ruido Gaussiano para las señales coseno y tren de pulsos cuadrados

    ruidoC = normrnd( 0, 0.1, length( senalFiltradaC ) );
    ruidoT = normrnd( 0, 0.1, length( senalFiltradaT ) );   
    
% Sumamos ruido a cada señal

    senalContCos = senalFiltradaC + ruidoC( 1, : );
    senalContTre = senalFiltradaT + ruidoT( 1, : );
    
% Filtramos señales, con cada filtro establecido

    senalRecuperadaCos = filter( bButt3, aButt3, senalFiltradaC );
    
