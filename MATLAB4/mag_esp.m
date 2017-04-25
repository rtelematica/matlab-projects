%% Graficas de magnitud y fase du un espectro

%Señal
close all;

n = -10 : 10;

N = 12;

x_n = 1 + sin( 2 * pi / N * n ) + 3 * cos( 2 * pi / N * n ) + cos( 4 * pi / N * n + pi / 2 );
%x_n = sin(2*pi*n/N)


figure(4)
f = fftshift( fft( x_n, 1024 ) );

plot(0:length( f)-1, abs(f));

figure( 1 )
stem( n, x_n )

a=0;

for k = 0 : N - 1
    
    com = 0;
    
    for n = 0 : N - 1
        
       com = com + x_n( n + 1 ) * exp( -1j * k * 2* pi * n / N ); 
        
    end
    
    a( k + 1 ) = 1 / N * com;
  
end

figure(2)
stem(0:length(a)-1, abs( a ) ), title('Coeficientes de la Serie de Fourier: Magnitud')

figure(3)
stem(0:length(a)-1, angle( a ) ), title('Coeficientes de la Serie de Fourier: Fase')

