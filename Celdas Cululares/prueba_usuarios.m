
    close all
    
    
    DELTA = 0.02;
    r = 3;
    N = 10;
    x0 = 1;
    y0 = 1;
    
    x = 0;
    y = 0;
    
    [x,y] = generaUsuarios( N, r, DELTA , x0, y0 );
    hold on
    dibujaHexagono( r, x0, y0);
    
    plot(x,y, 'o')
    
    