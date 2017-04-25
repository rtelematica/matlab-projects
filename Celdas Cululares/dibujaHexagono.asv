function dibujaHexagono( r, x0, y0)

    h = sqrt(3)/2 * r;
    l = r / 2;
    
    %x0 = r;
    %y0 = h;


    xl = x0 + l;
    xl_ = x0 - l;

    xr = x0 + r;
    xr_ = x0 - r;
 
    yh = y0 + h;
    yh_ = y0 - h;

    %Coordendas x de los puntos Pi
    hexa_x = [ xl_, xl, xr, xl, xl_, xr_, xl_ ];

    %Coordenadas y de los puntos Pi
    hexa_y = [ yh, yh, y0, yh_, yh_, y0, yh ];

    
    plot( hexa_x, hexa_y, 'b');

end