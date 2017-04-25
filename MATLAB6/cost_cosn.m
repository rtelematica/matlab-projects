
close all;

%% Se�al continua

F = 300;

t= [ 0 : 0.001 : F ];

%x_t = cos( 8 * pi * t / 31 );
x_t = cos( t / 6 );

figure( 1 )
plot( t, x_t, '-.b', 'Color', 'red' ), hold on, grid on, title( 'Se�al continua' );


%% Se�al discreta

n = [ 0 : F ];

x_n = cos( n / 6 );

stem( n, x_n );
legend( 'Senal Continua: T = 31/4', 'Senal Discreta: N = 31', 'Location', 'SouthEast');
 