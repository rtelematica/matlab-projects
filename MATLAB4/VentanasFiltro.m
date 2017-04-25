 
% 5ta. Parte  Ventanas
%
 
    % Se establece la venta a usar
    ventana = hamming( 120 );
  
    % Determinamos los coeficientes de la ventana
    coefVent = fir1( length( ventana ) - 1, 0.1, ventana );
    
    % Respuesta en frecuencia
    figure( 1 )
    freqz( coefVent, 1 );
    
    % Respuesta al impulso
    figure( 2 )
    impz( coefVent, 1 );
    
    % Plano complejo
    figure( 3 )
    zplane( coefVent, 1 );  
    
    
% 6ta. Parte  Filtrado mediante ventanas
%    
    datosFiltrados = filter( coefVent, 1, senalCont );
    
    figure( 4 )
    plot( 1 : length( datosFiltrados ), datosFiltrados )
    
    
    
