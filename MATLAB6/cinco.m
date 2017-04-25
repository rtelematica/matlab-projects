
%% PROCESAMIENTO DIGITAL DE SE�ALES 
%% Practica 2 - Correlaci�n

clc, clear all;   % Limpia

%   PUNTO 2:
% Lee archivo de audio a 10000 muestras
[ senal_voz, fs, nbits ] = wavread( 'm5')

% Normalizamos la se�al de voz. Utilizando la funci�n maxValor() que
% devuelve el valor m�ximo del vector 
senal_voz = senal_voz ./ maxValor( senal_voz );   

%   PUNTO 3:
% Gr�fica de la se�al de voz normalizada
figure( 1 )
plot( 0 : length( senal_voz ) - 1, senal_voz ), 
title( 'Se�al de voz con 10000 muestras' ),
ylabel( 'Amplitud' )
xlabel( 't' );

%   PUNTO 4:

%   PUNTO 5:
% Se�al aleatoria que se tomara como ruido 
    ruido = normrnd( 0, 1, 1, 200 );

% Gr�fica de la se�al de ruido
figure( 2 )
subplot(2,1,1), stem( 0 : length( ruido ) - 1, ruido ), 
title( 'Gr�fica de la se�al de ruido con 200 muestras' ),
ylabel( 'Amplitud' )
xlabel( 'n' );

% Autocorrelaci�n del ruido
autocorr_ruido = xcorr( ruido, ruido );

% Gr�fica de la autocorrelaci�n del ruido
subplot( 2, 1, 2 ), stem( 0 : length( autocorr_ruido ) - 1, autocorr_ruido ), 
title( 'Autocorrelacion de la se�al de ruido' ),
ylabel( 'Amplitud' )
xlabel( 'n' );


%   Se�al peri�dica sinusoidal
% Vector de tiempo de la se�al seno
tsin = [ 0 : 0.01 : 3 ];
% Frecuencia de muestreo de la se�al seno
fmsin = 3;
% Se�al periodica seno
xsin = sin( 2 * pi * fmsin * tsin );

figure( 3 )
%Gr�fica de la se�al periodica seno
subplot( 2, 1, 1 ), stem( tsin, xsin ), 
title( 'x[n] = sin( 2 * pi * fm * t ); fm = 3Hz' ),
ylabel( 'Amplitud' )
xlabel( 'n' );
 
% Atocorrelaci�n de la se�al peri�dica seno
autocorr_sin = xcorr( xsin );

% Gr�fica de la autocorrelaci�n del seno
subplot(2,1,2), stem( 0 : length( autocorr_sin ) - 1, autocorr_sin ), 
title( 'Autocorrelacion de x[n]' ),
ylabel( 'Amplitud' )
xlabel( 'n' );

%   PUNTO 6:
%Particion de la se�al de voz en tramas de 200 muestras

for i = 0 : 1%length( senal_voz ) / 200 - 1;       
    
    figure( 4 )
    % Gr�fica de un tramo de 200 muestras de la se�al de voz
    subplot( 2, 1, 1 ), stem( 200 * i + 1 : 200 * ( i + 1 ), senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) ), 
    title( 'Trama de 200 muestras de la se�al de voz original' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
        
    % Autocorrelaci�n de un tramo de 200 muestras de la se�al de voz
    autocorr_senal_voz = xcorr( senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) );
    subplot( 2, 1, 2 ), stem( 0 : length( autocorr_senal_voz ) - 1, autocorr_senal_voz ), 
    title( 'Autocorrelacion de la trama de la se�al de voz' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
       
    pause();
    
end

%   PUNTO 7:

% Se�al de ruido que se sumar� a la se�al de voz de tama�o igual a la se�al
% de voz
adicion_ruido = normrnd( 0, 1, length( senal_voz ), 1 );

% Agregamos el ruido a la se�al de voz original
senal_voz_ruido = senal_voz + adicion_ruido;

% Normaliza se�al de voz contaminada
senal_voz_ruido = senal_voz_ruido ./ maxValor( senal_voz_ruido );

% Autocorrelacion de la se�al de voz contaminada
autocorr_senal_voz_ruido = xcorr( senal_voz_ruido );

%   PUNTO 8:

figure( 5 )
% Gr�fica de la se�al de voz original
subplot( 2, 1, 1 ), plot( 0 : length( senal_voz ) - 1, senal_voz ), 
title( 'Se�al de voz original' ),
ylabel( 'Amplitud' )
xlabel( 'n' );

% Gr�fica de la se�al de voz contaminada
subplot( 2, 1, 2 ), plot( 0 : length( senal_voz_ruido ) - 1, senal_voz_ruido ), 
title( 'Se�al de voz contaminada' ),
ylabel( 'Amplitud' )
xlabel( 'n' );

figure( 6 )
% Gr�fica de la autocorrelacion de la se�al de voz contaminada
plot( 0 : length( autocorr_senal_voz_ruido ) - 1, autocorr_senal_voz_ruido ), 
title( 'Autocorrelaci�n de la se�al de voz contaminada' ),
ylabel( 'Amplitud' )
xlabel( 'n' );

sound(senal_voz, fs );
sound(senal_voz_ruido, fs );

%   PUNTO 9:

%Particion de la se�al de voz contaminada

for i = 0 : 50 %length( senal_voz_ruido ) / 200 - 1;
       
    figure( 7 )
   
    % Gr�fica de un tramo de 200 muestras de la se�al de voz
    % contaminada
    subplot( 2, 1, 1 ), stem( 200 * i + 1 : 200 * ( i + 1 ), senal_voz_ruido( 200 * i + 1 : 200 * ( i + 1 ) ) ), 
    title( 'Trama de 200 muestrasde la se�al de voz contaminada' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
        
    % Autocorrelaci�n de un tramo de 200 muestras de la se�al de voz
    % containada
    autocorr_senal_voz_ruido = xcorr( senal_voz_ruido( 200 * i + 1 : 200 * ( i + 1 ) ) );
    subplot( 2, 1, 2 ), stem( 0 : length( autocorr_senal_voz_ruido ) - 1, autocorr_senal_voz_ruido ), 
    title( 'Autocorrelaci�n de la trama de la se�al de voz contaminada ' ),
    ylabel( 'Amplitud' )
    xlabel( 'n' );
        
    pause();
  
end
