%% Graficas de magnitud y fase du un espectro

%Señal

n = -10 : 10;

N = 5;

x_n = 1 + sin( 2 * pi / N * n ) + 3 * cos( 2 * pi / N * n ) + 4 * cos( 4 * pi / N * n + pi / 2 );

figure( 1 )
stem( n, x_n )