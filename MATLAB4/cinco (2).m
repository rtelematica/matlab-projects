
%% PROCESAMIENTO DIGITAL DE SEÑALES 
%% Practica 2 - Correlación

clc, clear all;   % Limpia

%   PUNTO 2:
[senal_voz, fs, nbits] = wavread( 'm9');   % Lee archivo de audio a 10000 muestras

% Normalizamos la señal de voz. Utilizando la función maxValor() que
% devuelve 
senal_voz = senal_voz ./ maxValor( senal_voz );   

%   PUNTO 3:
% Gráfica de la señal de voz normalizada
figure( 1 )
plot( 0 : length( senal_voz ) - 1, senal_voz )

%   PUNTO 4:

%   PUNTO 5:
% Señal aleatoria que se tomara como ruido 
ruido = normrnd( 0, 1, 1, 200 );

% Gráfica de la señal de ruido
figure( 2 )
subplot(2,1,1), stem( 0 : length( ruido ) - 1, ruido )

% Autocorrelación del ruido
autocorr_ruido = xcorr( ruido, ruido );

% Gráfica de la autocorrelación del ruido
subplot( 2, 1, 2 ), plot( 0 : length( autocorr_ruido ) - 1, autocorr_ruido )


%   Señal periódica sinusoidal
% Vector de tiempo de la señal seno
tsin = [ 0 : 0.01 : 3 ];
% Frecuencia de muestreo de la señal seno
fmsin = 3;
% Señal periodica seno
xsin = sin( 2 * pi * fmsin * tsin );

figure( 3 )
%Gráfica de la señal periodica seno
subplot( 2, 1, 1 ), plot( tsin, xsin );
 
% Atocorrelación de la señal periódica seno
autocorr_sin = xcorr( xsin );

% Gráfica de la autocorrelación del seno
subplot(2,1,2), plot( 0 : length( autocorr_sin ) - 1, autocorr_sin );

%   PUNTO 6:
%Particion de la señal de voz en tramas de 200 muestras

for i = 0 : 1%length( senal_voz ) / 200 - 1;       
    
        figure( 4 )
        % Gráfica de un tramo de 200 muestras de la señal de voz
        subplot( 2, 1, 1 ), plot( 200 * i + 1 : 200 * ( i + 1 ), senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) );
        
        % Autocorrelación de un tramo de 200 muestras de la señal de voz
        autocorr_senal_voz = xcorr( senal_voz( 200 * i + 1 : 200 * ( i + 1 ) ) );
        subplot( 2, 1, 2 ), plot( 0 : length( autocorr_senal_voz ) - 1, autocorr_senal_voz );
        
        pause();
end

%   PUNTO 7:

% Señal de ruido que se sumará a la señal de voz de tamaño igual a la señal
% de voz
adicion_ruido = normrnd( 0, 1, length( senal_voz ), 1 );

% Agregamos el ruido a la señal de voz original
senal_voz_ruido = senal_voz + adicion_ruido;

% Normaliza señal de voz contaminada
senal_voz_ruido = senal_voz_ruido ./ maxValor( senal_voz_ruido );

%   PUNTO 8:

figure( 5 )
% Gráfica de la señal de voz original
subplot( 2, 1, 1 ), plot( 0 : length( senal_voz ) - 1, senal_voz );

% Gráfica de la señal de voz contaminada
subplot( 2, 1, 2 ), plot( 0 : length( senal_voz_ruido ) - 1, senal_voz_ruido );

sound(senal_voz, fs );
sound(senal_voz_ruido, fs );

%   PUNTO 9:

%Particion de la señal de voz contaminada

for i = 0 : 1 %length( senal_voz_ruido ) / 200 - 1;
       
        figure( 6 )
   
        % Gráfica de un tramo de 200 muestras de la señal de voz
        % contaminada
        subplot( 2, 1, 1 ), plot( 200 * i + 1 : 200 * ( i + 1 ), senal_voz_ruido( 200 * i + 1 : 200 * ( i + 1 ) ) );
        
        % Autocorrelación de un tramo de 200 muestras de la señal de voz
        % containada
        autocorr_senal_voz_ruido = xcorr( senal_voz_ruido( 200 * i + 1 : 200 * ( i + 1 ) ) );
        subplot( 2, 1, 2 ), plot( 0 : length( autocorr_senal_voz_ruido ) - 1, autocorr_senal_voz_ruido );
        
        pause();
  
end
