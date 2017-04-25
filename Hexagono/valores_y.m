
function z = valores_y(mat_dist, DELTA)

    mat_valoresy = 0;
    
    for j = 1 : length( mat_dist( :, 1 ) )
        for i = 1 : length( mat_dist( 1, :) )
            
            if mat_dist( j, i ) == 1
                mat_valoresy( j, i ) = DELTA * ( j - 1 );
                
            else            
                mat_valoresy( j, i ) = -1;
                
            end
            
        end
    end
    
    z = mat_valoresy;

end