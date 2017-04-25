function [x, y] = distAleatoria_Usuario( numUsuario, h, DELTA)

    ale_x = 0;
    ale_y = 0;
    
    i = 1;
            
    while i <= numUsuario
        %Aleatorios para x
        acu_x = randi( round(2.32*h/DELTA)+3, 1) - 1;
               
        %Aleatorios para y
        acu_y = randi(round(2*h/DELTA)+3, 1) - 1; 
        
        
        if and( ( 1/0.58 ) * DELTA * (acu_x) + h >= DELTA * (acu_y),  -1*( 1/0.58 ) * DELTA * (acu_x) + h <= DELTA * (acu_y) )        
            if and( ( 1/0.58 ) * DELTA * (acu_x) - 3*h <= DELTA * (acu_y),  -1*( 1/0.58 ) * DELTA * (acu_x) + 5*h >= DELTA * (acu_y) )
                if DELTA*(acu_y) <= 2 * h    
            
                    ale_x(i) = acu_x;
                    ale_y(i) = acu_y;
                
                    for l = 1 : length( ale_x ) - 1
                        if and( ale_x(l) == ale_x(i) , ale_y(l)== ale_y(i) )
                            i = i - 1;
                            break;
                                
                        end
                                
                    end
                                
                    i = i + 1;
                end
            end
                 
        end
                              
    end
    
    %Pasamos los valores de ale_x y ale_y a valores de h
    
     ale_x = ale_x*DELTA;
     ale_y = ale_y*DELTA;
    
     x = ale_x;
     y = ale_y;
    
end

% %Se delimita el punto obtenido al hexagono
%         if and( ( 1/0.58 ) * DELTA * (acu_x-1) + h >= DELTA * (acu_y-1),  -1*( 1/0.58 ) * DELTA * (acu_x-1) + h <= DELTA * (acu_y-1) )        
%             if and( ( 1/0.58 ) * DELTA * (acu_x-1) - 3*h <= DELTA * (acu_y-1),  -1*( 1/0.58 ) * DELTA * (acu_x-1) + 5*h >= DELTA * (acu_y-1) )
%                 ale_x(i) = acu_x;
%                 ale_y(i) = acu_y;
%                 
%                 for l = 1 : length( ale_x ) - 1
%                     if and( ale_x(l) == ale_x(i) , ale_y(l)== ale_y(i) )
%                     i = i - 1;
%                     break;
%                                
%                     end
%                                
%                 end
%                 
%             else
%                 i = i - 1;
%                 
%             end
%             
%         end
%                         
%         i = i + 1;
         