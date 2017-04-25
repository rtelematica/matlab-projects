function z = distancia_Puntos( mat_dist, h, DELTA )

    d = 0;
    for j = 1 : length( mat_dist( :, 1) )
        for i = 1 : length( mat_dist( 1, :) )
            if mat_dist( j, i ) == 1
                
                d(j, i) = ( ( 1.16 * h - DELTA*(i-1) )^2 + ( h - DELTA*(j-1) )^2 )^0.5;    
            else
                d(j, i) = 0;
                
            end
            
        end
    end
    
    z = d;

end