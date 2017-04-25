%% MUESTREO IDEAL

% Limpiamos
clear all, close all, clc;          

% Vector de tiempo de la se�al x(t)
t = [ 0 : 0.001 : 2-0.001 ];         

% Frecuencias de los senos
f1 = 1;
f2 = 2;
f3 = 3;

% Se�al anal�gica x(t)
x_t = sin( 2 * pi * f1 * t ) + sin( 2 * pi * f2 * t ) + sin( 2 * pi * f3 * t );

% Gr�fica de la se�al anal�gica x(t)
figure( 1 )
plot( t, x_t ), 
title('Se�al anal�gica x(t)=sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t):f1=1:f2=3:f3=5'), 
xlabel('t'), ylabel('Amplitud');

% Tren de impulsos con un periodo
% ts = 0.05
% Mandamos a trenI el tama�o de t
trenI = t;

% Periodo
ts = 0.05;

% Recorremos el tama�o de trenI
for i = 1 : length( trenI )
    
    %Si el valor en trenI(i) es multiplo de ts
    if mod( trenI( i ), ts ) == 0  
        
        % Impulso
        trenI( i ) = 1; 
        
    % Si el valor trenI(i) no es multiplo de ts   
    else 
        trenI( i ) = 0; 
    end % Fin if
    
end % Fin for

% Gr�fica del tren de impulsos
figure( 2 )
plot( t, trenI ),
title('Tren de impulsos con fs = 0.05'), 
xlabel('t'), ylabel('Amplitud');



% Transformada de fourier de la se�al anal�gica
X_f = fftshift( fft( x_t ) );
% Normalizamos amplitud
X_f = X_f ./ 1000;
% Vector de frecuancias para X_f
f = [ -500 : 0.5 : 500 - 0.5 ];

% Gr�fica del espectro de x_t
figure( 3 )
plot( f, abs( X_f ) ),
title(' Espectro de la se�al anal�gica x(t)'), 
xlabel('f'), ylabel('Amplitud');



% Se�al Muestreada Idealmente
sMuesI_t = x_t .* trenI;

% Gr�fica de la se�al muetreada
figure( 4 )
plot( t, sMuesI_t ),
title(' Se�al x(t) muestreada idealmente'), 
xlabel('t'), ylabel('Amplitud');


% Espectro de la se�al muestreada
sMuesI_f = fftshift( fft( sMuesI_t ) );
% Normalizaci�n en amplitud
sMuesI_f = sMuesI_f ./ 20;

% Gr�fica del espectro de la se�al muetreada
figure( 5 )
plot( f, abs( sMuesI_f ) ),
title(' Espectro de la se�al x(t) muestreada idealmente'), 
xlabel('f'), ylabel('Amplitud');



%% MUESTREO NATURAL

% Tren de pulsos con un periodo
% ts =0.05 y una duracion de 0.01

% Mandamos lenght(t) ceros a trenP
trenP = zeros( 1, length( t ) );
% Periodo
ts = 0.05;
% Duraci�n
td = 0.01;

% Recorremos a t
for i = 1 : length( t )
    
    % Si el valor de t(i) es multiplo de ts
    if mod( t( i ), ts) == 0
        
        % Inicio pulso
        trenP(i) = 1;
        
        % Llenamos de uno�s las siguientes 9 
        % posiciones
        for j = 1 : 9
            trenP(i + j) = 1;
            
        end %Fin for
       
    end % Fin if
   
end %Fin for

% Gr�fica del tren de pulsos
figure( 6 )
plot( t, trenP ),
title('Tren de pulsos con ts = 0.05 y td = 0.01'), 
xlabel('t'), ylabel('Amplitud');



% Se�al muestreada de manera natural
sMuesN_t = trenP .* x_t;

% Gr�fica de la se�al muestreada
figure( 7 )
plot( t, sMuesN_t ),
title(' Se�al x(t) muestreada de manera natural'), 
xlabel('t'), ylabel('Amplitud');


% Espectro de la se�al muestreada de manera natural
sMuesN_f = fftshift( fft( sMuesN_t ) );
sMuesN_f = sMuesN_f ./ 200;

% Gr�fica del espectro 
figure( 8 )
plot( f, abs( sMuesN_f ) ),
title(' Espectro de la se�al x(t) muestreada de manera natural'), 
xlabel('f'), ylabel('Amplitud');




%% MUESTREO DE CRESTA PLANA

% Nuestra se�al muestreada con Z0H la
% igualamos con la se�al muestreada de 
% manera ideal
sMuesCP_t = sMuesI_t;

% Valor que se retendr�
retenedor = 0;

for i = 0 : length( sMuesCP_t ) - 1
   
    % Buscamos valores a retener
    if mod( i, 50 ) == 0
    
        % Valor de retenci�n
        retenedor = sMuesCP_t( i + 1 );
        
        for j = 1 : 9
            
            sMuesCP_t( i + j + 1 ) = retenedor;
            
        end
        
    else
        % Mantenemos el valor en retenedor
        %sMuesCP_t( i + 1 ) = 0;    
        
    end % Fin if

end % Fin for

%pulso

%pulso = ones(1, 10);

%sMuesCP_t = conv( sMuesI_t, pulso);



% Gr�fica de la se�al muestreada con Z0H
figure( 9 )
plot( 0:length(sMuesCP_t)-1, sMuesCP_t ),
title('Se�al x(t) muestreada con Z0H'), 
xlabel('t'), ylabel('Amplitud');


% Espectro de la se�al muestreada
sMuesCP_f = fftshift( fft( sMuesCP_t ) );
%Normalizaci�n de amplitud
sMuesCP_f = sMuesCP_f ./ 200;

% Gr�fica del espectro
figure( 10 )
plot( f, abs( sMuesCP_f )),
title(' Espectro de la se�al x(t) muestreada con Z0H'), 
xlabel('f'), ylabel('Amplitud');


%% Espectro de trenI y trenP

% Tren de impulsos
%trenI_f = fftshift( fft( trenI ) );
%Normalizaci�n de amplitud
%trenI_f = trenI_f ./ 40;

% Gr�fica del espectro del tren de impulsos
%figure( 11 )
%plot( f, abs( trenI_f )),
%title(' Espectro del tren de impulsos'), 
%xlabel('f'), ylabel('Amplitud');

% Tren de pulsos
%trenP_f = fftshift( fft( trenP ) );
%Normalizaci�n de amplitud
%trenP_f = trenP_f ./ 400;

% Gr�fica del espectro del tren de impulsos
%figure( 12 )
%plot( f, abs( trenP_f )),
%title(' Espectro del tren de pulsos'), 
%xlabel('f'), ylabel('Amplitud');


%% ssss

%pulso = ones(1, 10);

%s = conv(sMuesI_t,pulso)

%figure( 13 )
%plot( 0:length(s)-1, s),
%title(' Espectro del tren de pulsos'), 
%xlabel('f'), ylabel('Amplitud');



