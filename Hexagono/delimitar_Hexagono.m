function [z, qui] = delimitar_Hexagono( mat_dist, h, DELTA )

    qui = 0;
    for j = 1 : length( mat_dist( :, 1 ) )
        for i = 1 : 0.58 * h / DELTA
            
            if mat_dist( j, i ) == 1
                if or( ( 1/0.58 ) * DELTA * (i-1) + h < DELTA * (j-1),  -1*( 1/0.58 ) * DELTA * (i-1) + h > DELTA * (j-1) )
                    mat_dist( j, i ) = 0;
                    qui = qui + 1;
                                    
                end
                
            end
            
        end
        
    end

    for j = 1 : length( mat_dist( :, 1 ) )
        for i = round( 3 * 0.58 * h / DELTA + 1 ) : round ( 2.32 * h / DELTA + 1 )
                    
            if mat_dist( j, i ) == 1
                if or( ( 1/0.58 ) * DELTA * (i-1) - 3*h > DELTA * (j-1),  -1*( 1/0.58 ) * DELTA * (i-1) + 5*h < DELTA * (j-1) )
                    mat_dist( j, i ) = 0;
                    qui = qui + 1;
                    
                end
                
            end
            
        end
        
    end
    
    z = mat_dist;
end