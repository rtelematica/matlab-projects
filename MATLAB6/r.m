
%% Gr�ficas de X(w) y x[k]

clear all, close all;

% Ejemplo: Determinar la DFT de N-puntos de
%               sen(wL/2)
%       X(w) = ----------- e(-jw(L-1)/2)
%               sen(w/2)

;w = [ -2 : 0.01 : 2 ];
L=10;

%  Desarrollo de la Transformada de Fourier de Tiempo Discreto

i = 1;
for w = 1 : 0.01 :L
    
    Xw( i ) = sin( w * L / 2 ) / sin( w / 2 ) * exp( -1j * w * ( ( L - 1 ) / 2 ) );
    
    i = i + 1;
    
end

figure( 1 )
plot( w, Xw ), 
xlabel( 'w' ), 
ylabel( 'Amplitud' ), 
title( 'Transformada de Fourier de Tiempo Discreto, con L=10' );

%  Observamos que la gr�fica obtenida por la figura 1 se asemeja a una
%senoide cuando el resultado esperado deber�a ser una funci�n semejante a
%una samplin.

%  El siguiente c�digo muestra el c�lculo mediante fft para obtener la X(w)
%real y no la que se obtiene en la figura anterior.

Xn=ones(1,10);
Xw2=fftshift(fft(Xn,1024));

figure(2);
plot(0:length(Xw2)-1,abs(Xw2)),
xlabel( 'Muestras de frecuencia' ),
ylabel( 'Magnitud' ),
title( 'DTFT calculado con la fft sin normalizar el eje de frecuencia' );

%Nota: no pude resolver dicho problema.


%  Resolviendo la DFT de Npuntos se obtiene la expresi�n:
%               sen(pikL/N)
%       x[k] = ----------- e(-jpik(L-1)/N)
%               sen(pik/N)

%Desarrollando la expresion anterior obtenemos.


N = 50;

i = 1;

%Graficando en un peri�do de -2N a 2N:
for k = -2*N : 2N 
    
    Xk( i ) = sin( pi * k * L / N ) / sin( pi * k / N ) * exp( -1j * pi * k * ( L - 1 ) / N );
    i = i + 1;
    
end

figure( 3 )
stem( 0 : length( Xk ) - 1, abs( Xk ) ), 
xlabel( 'k' ), 
ylabel( ' Amplitud' ), 
title( 'Transformada de Discreta de Fourier, con N=50' );

