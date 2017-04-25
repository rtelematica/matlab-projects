function conversionC(h,g,nombre)

    % crear un archivo nombre.cof con los valores de h y g
        
    Nf = length(h(:,1));
    Nc = length(h(1,:));
    
    fileID = fopen(nombre,'w');
    fprintf(fileID, '#define Nc %d\n', Nf);
    fprintf(fileID, '#define Ne %d\n\n', Nc);
    fprintf(fileID, 'float h_gen[Nc][Ne] = { ' )
    for i = 1 : Nf
        for j = 1 : Nc

            if i == Nf & j == Nc
                fprintf(fileID, '%f  ', h(i,j));        
            else
                fprintf(fileID, '%f,  ', h(i,j));        
            end
        end

        if i == Nf
            fprintf(fileID, '\n                    };');
        else
            fprintf(fileID, '\n                      ');
        end    
    end
    
    fprintf(fileID, '\n\nfloat g_gen[Nc][Ne] = { ' )
    for i = 1 : Nf
        for j = 1 : Nc

            if i == Nf & j == Nc
                fprintf(fileID, '%f  ', g(i,j));        
            else
                fprintf(fileID, '%f,  ', g(i,j));        
            end
        end

        if i == Nf
            fprintf(fileID, '\n                    };');
        else
            fprintf(fileID, '\n                      ');
        end

    
    end


end

