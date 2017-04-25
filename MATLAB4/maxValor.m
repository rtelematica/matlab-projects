%% Función que devuelve el mayor valor de los elementos de un vector 
function y = maxValor( x )  

    if length( x ) < 1  %Comprueba que haya mas de cero elementos
    
        y = 0;
        
        return;
        
    end

    x_abs = abs( x );  % Tomamos los valores absolutos de los elementos
    
    max = x_abs( 1 ); % Variable donde se almacena el maximo de x,
                      % y suponemos inicialmente que es el primer valor.
    
    for i = 1 : length( x_abs )
    
        if max < x_abs( i ) % Comprobamos si los valores de cada elemento
                            % del vector son mayores a max, esto determina
                            % que existe un elemnento mayor dentro de x
                            
            max = x_abs( i ); % Se manda el mayor a max a max            
            
        end
    end
    
    y = max;
    
end