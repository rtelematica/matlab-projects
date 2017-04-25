clc, clear all, close all;   % Limpia

%   PUNTO 2:
% Lee archivo de audio a 10000 muestras
[ senal_voz, fs, nbits ] = wavread( 'm5')

% Normalizamos la señal de voz. Utilizando la función maxValor() que
% devuelve el valor máximo del vector 
senal_voz = senal_voz ./ max( senal_voz );

for i = 0 : 1%length( senal_voz ) / 200 - 1;       
    
    figure( 1 )
    % Gráfica de un tramo de 200 muestras de la señal de voz
    subplot( 3, 1, 1 ), stem( 200 * i + 1 : 200 * ( i + 1 ), senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) ), 
    title( 'Trama de 200 muestras de la señal de voz original' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
    
    % Autocorrelación de un tramo de 200 muestras de la señal de voz
    autocorr_senal_voz = xcorr( senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) );
    subplot( 3, 1, 2 ), stem( 0 : length( autocorr_senal_voz ) - 1, autocorr_senal_voz ), 
    title( 'Autocorrelacion de la trama de la señal de voz' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
    
    r = hamming ( length( senal_voz ) );
    x = r.*senal_voz;
    rx = xcorr(x);
    subplot( 3, 1,3 ), stem( 0 : length( rx ) - 1, rx );
    
    pause(); 
    
 end