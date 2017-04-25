
close all;

%% Pr�ctica Finite-Impulse Response Filter Design Techniques
% Tecnicas de Dise�o de Filtros de Respuesta al Impulso Finito (FIR)

%    1. Ventana Rectangular
%    2. Ventana Triangular o Bartlett
%    3. Ventana Coseno Alzado


% %% 1. Ventana Rectangular
% %
% %           | 1, -(N-1)/2 <= n <= (N-1)/2
% %   wr(n) = |
% %           | 0, otro caso
% %
% 
% %Usando funci�n de MatLab para esta venta se tiene
%   N = 31;  % Puntos de la ventana
%   wr = rectwin( N );  % Ventana Rectangular
% 
% 
% % A) Gr�fica de la ventana 
%   figure( 1 )
%   n_wr = [ -(N-1)/2 : (N-1)/2 ];  %Vector de tiempo
%   stem( n_wr, wr ), 
%   title( 'Ventana Rectangular, N = 31' ),
%   xlabel( 'n' ), 
%   ylabel( 'wr(n)' );
% 
% % Espectro de la se�al wr
%   Nm = 1024;  %Numero de muestras
%   WR = fftshift( fft( wr, Nm ) ); 
% 
% % Normalizamos la amplitud de WR
%   WR = WR / N;
% 
% % Mostramos la parte positiva del espectro (ancho de banda)
%   lWR = floor( length( WR ) / 2 );
%   WR=WR( lWR : 2*lWR - 1 ); 
% 
% % Eje de frecuencias
%   eWR=( 0 : lWR - 1 ) * ( Nm / 2 ) / ( lWR - 1 );
%  
% % Normalizamos el eje de frecuencias a radianes/seg
%   eWR = eWR * pi / length ( eWR );
% 
% % B) Gr�fica del espectro
%   figure( 2 )
%   plot(eWR, WR ),
%   title( 'Espectro de la Ventana Rectangular, N = 31' ), 
%   xlabel( 'w' ), 
%   ylabel( 'WR( w )' );
% 
% % C) Gr�fica en magnitud logar�tmica del espectro
%   figure( 3 )
%   plot(eWR, db( abs( WR ) ) ),
%   title( 'Magnitud (db) del Espectro de la Ventana Rectangular, N = 31' ),
%   xlabel( 'w' ), 
%   ylabel( ' | WR( w ) | db' );
% 
% 
% 
% %% 2. Ventana Triangular o Bartlett 
% %
% %           | 1 - 2|n|/(N-1), -(N-1)/2 <= n <= (N-1)/2
% %   wt(n) = |
% %           | 0, otro caso
% %
% 
% %Usando funci�n de MatLab para esta venta se tiene
%   N = 31;  % Puntos de la ventana
%   
%   wt = triang( N );  % Ventana Triangular
% 
%   fvtool(wt)
% 
% % A) Gr�fica de la ventana 
%   figure( 4 )
%   n_wt = [ -(N-1)/2 : (N-1)/2 ];  %Vector de tiempo
%   stem( n_wt, wt ), 
%   title( 'Ventana Triangular, N = 31' ),
%   xlabel( 'n' ), 
%   ylabel( 'wt(n)' );
% 
% 
% % Espectro de la se�al wt
%   Nm = 1024;  %Numero de muestras
%   WT = fftshift( fft( wt, Nm));
%      
% % Normalizamos la amplitud de WT
%   WT = WT / 16;
%   
% % Mostramos la parte positiva del espectro (ancho de banda)
%   lWT = floor( length( WT ) / 2 );
%   WT = WT( lWT : 2*lWT - 1 );
% 
% % Eje de frecuencias
%   eWT = 1;
%   eWT = ( 0 : lWT - 1 ) * ( Nm / 2 ) / ( lWT - 1 );
%  
% % Normalizamos el eje de frecuencias a radianes/seg
%   eWT = eWT * pi / length ( eWT );
%  
% % B) Gr�fica del espectro
%   figure( 5 )
%   plot( eWT, WT ),
%   title( 'Espectro de la Ventana Triangular, N = 31' ),
%   xlabel( 'w' ), 
%   ylabel( 'WT( w )' );
%  
% % C) Gr�fica en magnitud logar�tmica del espectro
%   figure( 6 )
%   plot(eWR, db( abs( WR ) ) ),
%   title( 'Magnitud (db) del Espectro de la Ventana Triangular, N = 31' ),
%   xlabel( 'w' ), 
%   ylabel( ' | WT( w ) | db' );
% 
%   
  
%% 3. Ventana Coseno Alzado
%
%           | 0.5 + 0.5cos(2*pi*n/(N-1)) , -(N-1)/2 <= n <= (N-1)/2
%   wc(n) = |
%           | 0, otro caso
%

%Usando funci�n de MatLab para esta venta se tiene
  N = 31;  % Puntos de la ventana
  
  %s = [-(N-1)/2:(N-1)/2];
  %wt = 1 - 2*abs(s)/(N-1);
  c = [ -( N - 1 ) / 2 : ( N - 1 ) / 2 ];
  wc = 0.5 + 0.5 * cos( 2 * pi * c / ( N - 1 ) );  % Ventana Coseno Alzado

% A) Gr�fica de la ventana 
  figure( 7 )
  n_wc = [ -(N-1)/2 : (N-1)/2 ];  %Vector de tiempo
  stem( n_wc, wc ), 
  title( 'Ventana Coseno Alzado, N = 31' ),
  xlabel( 'n' ), 
  ylabel( 'wc(n)' );


% Espectro de la se�al wt
  Nm = 1024;  %Numero de muestras
  WC = fftshift( fft( wc, Nm));
     
% Normalizamos la amplitud de WT
  WC = WC / 15;
  
% Mostramos la parte positiva del espectro (ancho de banda)
  lWC = floor( length( WC ) / 2 );
  WC = WC( lWC : 2*lWC - 1 );

% Eje de frecuencias
  eWC = ( 0 : lWC - 1 ) * ( Nm / 2 ) / ( lWC - 1 );
 
% Normalizamos el eje de frecuencias a radianes/seg
  eWC = eWC * pi / length ( eWC );
 
% B) Gr�fica del espectro
  figure( 8 )
  plot( eWC, WC ),
  title( 'Espectro de la Ventana Triangular, N = 31' ),
  xlabel( 'w' ), 
  ylabel( 'WR( w )' );
 
% C) Gr�fica en magnitud logar�tmica del espectro
  figure( 9 )
  plot(eWC, db( abs( WC ) ) ),
  title( 'Magnitud (db) del Espectro de la Ventana Triangular, N = 31' ),
  xlabel( 'w' ), 
  ylabel( ' | WC( w ) | db' );

wvtool(wc)
%fvtool( wr, N )
%wvtool()







