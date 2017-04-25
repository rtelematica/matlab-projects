function z = distancia_Usuario( d_x, d_y, h, r )

    dist = 0;
    
    % El centro esta en (r, h)
    for i = 1 : length(d_x)
       
        dist(i) = ((d_x(i)-r)^2+(d_y(i)-h)^2)^0.5;    
        
    end
    
    z = dist;
end