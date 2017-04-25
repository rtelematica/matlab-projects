
%% Convoluci�n entre dos se�ales x[n] y h[n]

function y = convx_h( x, h )

    %Tama�o de los funciones

    tam_x = length( x );
    tam_h = length( h );
    
    % Vector de ceros de tama�o tam_x - 1 : tam_h - 1, para concatenar con 
    % h y x respectivamete para realizar multiplicaci�n sin que falten 
    % elementos para multiplicar y no genere error
    
    cerosh = zeros( 1, tam_x - 1 );
    cerosx = zeros( 1, tam_h - 1 );
    
    % hN: h concatenada con cerosh
    % xN: x concatenada con cerosx
    hN = [ h, cerosh ];
    xN = [ x, cerosx ];
      
    % Realizamos multiplicaci�n en los elemento traslapados
    acumulador = 0;     % variable donde se almacena el valor de un desplazamiento
    convolucion = 0;    % variable donde se colocara el resultado de la multiplicacion
                        % dependiendo del valor de n
    
    for n = 1 : length( xN )       %recorremos los elementos de x con ceros incluidos
        
        for i = 0 : n - 1 
            
            % Realizamos multiplicaci�n elemento a elemento dependiendo de
            % su posici�n y se almacena en acumulador volviendo a sumar el
            % valor anterior
            
            acumulador = acumulador + xN(i+1)*hN(n-i);   
            
        end
           % Guardamos en el valor correspondiente de n el valor dado por
           % el acumulador
           convolucion(n) = acumulador;
            
            acumulador = 0;     % Iniciamos el valor del acumulador a cero
                                % para que no se sume el valor en la sig 
                                % operaci�n
    end
    
    y = convolucion;    % Retornamos el vector convoluci�n
    
end