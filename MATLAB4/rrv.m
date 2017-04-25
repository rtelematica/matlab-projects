%% Funció que rota a la derecha un vector.
% El último elemento del vector lo coloca en la primera posicion de este,
% ejemplo:
% 
% A = [ a1, a2, a3,...an-1, an ]
% B = rrv( A )
%
% Resultado -> B = [ an, a1, a2, a3,..., an-1 ]

function y = rrv( x ) 

        tamX = length( x ); %  Tomamos el tamaño de x
        
        %  Vector que se rotara, se utiliza esta lógica de duplicar el
        %  vector, ya que al rotar un vector, el elemento x[i+1] debe de
        %  ser igual al elemento x[i] y por lo tanto se pierde el valor en 
        %  esta posicion (x[i+1]), dado que en la iteracion no se respalda 
        %  el valor de x[i+1], se accede a él mediante la posición del 
        %  verdadero vector(x) y no de la posición de la copia(x_rot), ya que en esta
        %  el valor del elemento ya no existe, porque fue cambiada por x[i]
        x_rot = x; %  Vector que se rota
      
        for i = 1 : tamX - 1
            
           x_rot( i + 1 ) = x( i ); %  Rotamos secuencia a la derecha
                 
        end %  Fin for
        
        x_rot( 1 ) = x( tamX ); %  Colocamos el valor de x[5] en x_rot[1].
        
        y = x_rot; %  Devolvemos resultado
        
end