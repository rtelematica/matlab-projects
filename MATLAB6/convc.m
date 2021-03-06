
%% CONVOLUCI�N CIRCULAR

%% Programa:
% Dadas las secuencias x1 y x2, realizar un programa que determine la
% convoloci�n circular entre ambas secuencias.

%--------------------------------------------------------------------

    n=[ 0:7];
     % Ejemplo desarrollado en clase
     x1 = (1/2).^(n);  % Secuencia 1
     %x2 = [ 1 1 1 0 0 0 ];
     x2 =  cos(3*pi*n/8);  % Secuencia 2
     
 % Se determina el tama�o de las secuencias, l1 y l2 para x1 y x2 
 % respectivamente, para rellenar de ceros la secuenencia de menor tama�o,
 % el n�mero de ceros est� determinado por lmax - lmin.
 
     l1 = length( x1 );  % Tama�o de x1
     l2 = length( x2 );  % Tama�o de x2
 
     rellenoZ = zeros( 1, abs( l1 - l2 ) );  % Relleno de ceros
 
  % Comprobamos la secuencia de menor tama�o, y a esta la rellenamos de
  % ceros con rellenoZ
     if l1 > l2 % Si el tama�o de x1 es mayor a la tama�o de x2
         
         x2 = [ x2, rellenoZ ]; %  Rellenamos de ceros a x2
         N = l1; %  Tomamos como periodo el tama�o de x1
         
     elseif l1 < l2 % Si el tama�o de x1 es menor a la tama�o de x2
         
         x1 = [ x1, rellenoZ ]; %  Rellenamos de ceros a x1
         N = l2; %  Tomamos como periodo el tama�o de x2
         
     else %  Si las dos secuancias son de igual tama�o
         
         N = l1; %  Tomamos como periodo el tama�o de x1, 
                 %  aunque tambi�n podr�a se el de x2
         
     end %  Fin de if
     
    
 % Se necesita reflejar a la secuencia x2
 % Se obtiene la secuencia x2_r = [ x2[0], x2[N-1], ... , x[1] ] que es x2[-n]
 
     x2_r = [ x2( 1 ), invVector( x2( 2 : N ) ) ]; %  Obtenemos x2[-n] => x2_r
     
      
 % Se observa que rotar hacia la izquierda a la secuancia x2[-n] y
 % multiplicarla por x1[n], es lo mismo que, rota a la derecha a la
 % secuencia x1 y multiplicarla por x2[-n]. As� se tiene 
     
     cc = 0; %  Vector donde se almacena la convoluci�n circular
     x1_r = x1; % Usamos x1_r como respaldo de x1
     cum = 0; % Variable donde se almacena la suma de productos para cc(n)
     
      for n = 1 : N %  N�mero de puntos de la CC
          
          for i = 1 : N %  Tama�o de las secuencias 
              
              % Se multiplica cada elemento de los vectores y se almacena
              % en cum
              cum = cum + x2_r( i )*x1_r( i );                            
     
              
          end
          
          cc( n ) = cum; %  Almacenamos el valor de cum en la cc dada por n
          
          x1_r = rrv( x1_r ); %  Rotamos  a la derecha nuestra secuencia x1_r
          cum = 0; %  Limipiamos variable
         
      end %  Fin de for
      
      
      %  EN ESTE PUNTO SE OBTIENE EL RESULTADO DE LA CONVOLUCI�N CIRCULAR.
      
      cc = [ cc( 1 ), invVector( cc( 2 : N ) ) ]; %  Mostramos el resultado en pantalla
      
      figure( 1 )
      subplot( 2, 2, 1), stem( 0 : length( x1 ) - 1, x1 ), 
      title( 'Secuencia x1[n]'), xlabel('n'), ylabel('Amplitud')
      subplot( 2, 2, 2), stem( 0 : length( x2 ) - 1, x2 ),
      title( 'Secuencia x2[n]'), xlabel('n'), ylabel('Amplitud')
      subplot( 2, 1, 2), stem( 0 : length( cc ) - 1, cc ),
      title( 'Convoluci�n Circular entre x1[n] y x2[n]'), xlabel('n'), ylabel('Amplitud')
      
      
      