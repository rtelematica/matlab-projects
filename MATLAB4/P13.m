
%% Practica 14, "Transformada inversa por expansión"...

clear all;
close all,
clc;

delta = 0.065;
n = 0;
nn = 0;
 for y = -2 : delta : 2
     
     for x = -2 : delta : 2
         
         z = x + j * y;
         
         z = - z;
         %HZ( n+1, nn+1 ) = abs( ( 1 + 3*z^(-1) + (11/6)*z^(-2) + (1/3)*z^(-3)) ./ ( 1 + (5/6)*z^(-1) + (1/6)*z^(-2) ) );
         %1.a
         HZ( n+1, nn+1 ) = abs( 0.46 / ( ( 1 - 0.32*z^(-1) )^4 ) );
         
         %1.b
         %HZ( n+1, nn+1 ) = abs( ( 1 - z^(-2) ) ./ ( 1 + 0.7*z^(-2)) );
         n = n + 1;
         
     end
     
     nn = nn + 1;
     n = 0;
     
   end;
    
x = [ -2 : delta : 2 ];
y = [ -2 : delta : 2 ];

figure( 1 )
surf( x, y, HZ )
xlabel( 'eje real' );
ylabel( 'eje imaginario' );
zlabel( 'Magnitud de Z' );


%Polos y ceros

%1.a
%A = [ 0.46 ];
%B = [ 1, 0.64, 0.1024 ];

%1.b
%A = [ 0.15, 0, 0.15 ];
%B = [ 1, 0, -0.7 ];


figure( 2 )
zplane( A, B )
title( 'Polos y Ceros' );

% respuesta al impulso

figure(3)
impz( A, B );

%[H,T] = impz( A, B );

%figure( 3 )
%stem( T, H )
%xlabel( 'frec' );
%ylabel( 'Magnitud' );
%title( 'Respuesta al impulso' );

%rspuesta en frecuencia

figure( 4 )
freqz(A, B);

figure( 5 )
[Hf, Tf] = freqz(A, B);
plot(Tf, abs(Hf))
xlabel('radianes / seg');
ylabel('Magnitud');