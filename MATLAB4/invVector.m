%% Funci�n que invierte un vector; ejemplo
% A = [ a1, a2, a3, a4,..., an-1, an ]
% B = invVector( A )
%
% Resultado ->  B = [ an, an-1,..., a4, a3, a2, a1 ]

function y = invVector( x ) 

    tamX = length( x ); %  Tomamos el tama�o de x
    
    for i = 1 : tamX - 1
    
        %  La siguiente instruccion, realiza la concatenacion de los primero
        %  i - 1 elementos de x con la rotacion de los �ltimos tamX - i
        %  elementos de x, el resultado de esto al iterar tamX - 1, ser�
        %  la reflexi�n del vector
        x = [ x( 1 : i - 1), rrv( x( i : tamX ) ) ];        
        
    end %  Fin del for
    
    y = x; %  Devolvemos resultado
        
end %  Fin de la funci�n invVector
