
%% Funcion que lleva a cabo una distribucion uniforme tipo 1 en un matriz

% Se entiende que si 1 entonces hay un usuario

function [z, nu] = dist_Uniforme1( x, y, esp )

    mat = 0;
    n = 0;
    for i = 1 : x
        for j = 1 : y
            
            %Condición necesaria que debe de cumplir i y j para 
            %considerarlo como un punto en el espacio
            if (mod(i+j-2, esp+1)==0 & mod(j-1, esp+1)==0) || (mod(i-(esp+3)/2 ,esp+1)==0 & mod(j-(esp+3)/2 ,esp+1)== 0)    
                mat(j,i) = 1;
                n = n + 1;

            else
                mat(j,i) = 0;
                
            end

        end
        
    end
    
    z = mat;
    nu = n;
end