%-----------------------------------------------
    %Filtros par, impar y peine

    %Filtro Par
    n_par = [ -5 : 5 ]
    coefPar = [ 10, 9, 8, 7, 6, 10, 6, 7, 8, 9, 10 ];
    
    coefImpar = [ -4, -5, -6, -7, 0, 7, 6, 5, 4 ];
    
    figure( 1 )
    impz( coefPar, 1);
    
    figure( 2 )
    freqz( coefPar, 1 );
    
    figure( 3 )
    zplane( coefPar, 1 );
    
    figure( 4 )
    impz( coefImpar, 1 );
    
    figure( 5 )
    freqz( coefImpar, 1 );
    
    figure( 6 )
    zplane( coefImpar, 1 );
    
    %-----------------------------------
    %peine
    
    filPeine = [ 1 0 0 0 0 0 0 0 0 0 0 -1];
    
    figure( 7 )
    impz( filPeine, 1 );
    
    figure( 8 )
    freqz( filPeine, 1 );
    
    figure( 9 )
    zplane( filPeine, 1 );
    
    
    
    
    
    
    
    
    
    
    
    
    
    