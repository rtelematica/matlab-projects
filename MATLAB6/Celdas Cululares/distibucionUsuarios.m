function [x, y] = distibucionUsuarios(x0, y0, N, r, DELTA)

%     x0 = 0;
%     y0 = 0;
%     r = 10;
% 
%     N = 5;
%  
%     DELTA = 0.01;


    h = sqrt(3)/2 * r;
    l = r/2;
    
    E = 10;
    tam_h = round((2*h+E*DELTA) /DELTA);
    tam_r = round((2*r+E*DELTA)/DELTA);
    
    i = 1;
    while i <= N
        
        aux_x= x0-r-2*DELTA + randi(tam_r)*DELTA;
        aux_y = y0-h-2*DELTA + randi(tam_h)*DELTA;
        
        %Limitamos en y = y0 + h
        
        if aux_y >= y0 - h & aux_y <= y0 + h
            if aux_y >= (h/(l-r)*(aux_x-x0+r)+y0) & aux_y <= (h/(l-r)*(aux_x-x0-r)+y0)
                if aux_y >= ((h/(r-l))*(aux_x-x0-r))+y0 & aux_y <= ((h/(r-l))*(aux_x-x0+r))+y0
                    
                    Px(i) = aux_x;
                    Py(i) = aux_y;

                    i = i + 1;
                    
                end
            end            
        end
    end
    
    x = Px;
    y = Py;
    
    %plot(x, y,'o')
   
end