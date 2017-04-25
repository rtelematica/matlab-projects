function analisisPerdidasUsuario( r, DELTA, SIGMA, Lth, numUsuarios, numFig )
    % r = 4000;
    % DELTA = 0.02;
    % SIGMA = 9;
    % Lth = 70;
    % numUsuarios = 150;  %N�mero de usuarios contenidos en el hexagono

    h = 0.862*r;

    % Calculamos los limites del hexagono
    hexa_x = [ 3*0.58*h, 4*0.58*h, 3*0.58*h, 0.58*h, 0, 0.58*h ];
    hexa_y = [ 2*h, h, 0, 0, h, 2*h ];

    line_x = [ 2.32*h 2.32*h 0 0];
    line_y =[ 0 2*h 2*h 0];


    % Montamos una distribucion aleatoria de usuarios en el hexagono
    [x, y] = distAleatoria_Usuario( numUsuarios, h, DELTA);

    % Calculamos la distancia para cada punto
    dist_Usuario = distancia_Usuario( x, y, h, r );

    % Calculamos perdidas
    perd_Usuario = perdidas_Usuario( dist_Usuario, SIGMA, 0 );
    perd_UsuarioLS = perdidas_Usuario( dist_Usuario, SIGMA, 1 );

    %Probabilidad de Cobertura
    P_COB = probabilidad_Cobertura( perd_Usuario, Lth ); 

    figure( numFig )
      
    subplot(3,1,1), patch(line_x, line_y, 'r');
    subplot(3,1,1), patch(hexa_x, hexa_y, 'g');

    %Se genera el titulo del grafico

    EE = ' ; ';
    NU = 'NumUser: ';
    RAD = 'Radio: ';
    KM = ' Km';
    SIG = 'Sigma: ';
    DB = ' [dB]';
    PCOBER = 'ProbCober: ';
    hold on
    informacion = [ NU num2str(numUsuarios) EE RAD num2str(r) KM EE SIG num2str(SIGMA) DB EE PCOBER num2str(P_COB) ];
    subplot(3,1,1), plot(x, y, 'o'), title( informacion ), xlabel('Km'), ylabel('Km')
    axis([0,2.5*h,0,2.5*h])
       
    
    subplot(3,1,2), plot(dist_Usuario, perd_Usuario, '.'), title('Perdidas por usuario sin perdidas por desvanecimientos lentos'), xlabel('Km'), ylabel('[dB]')

    subplot(3,1,3), plot(dist_Usuario, perd_UsuarioLS, '.'), title('Perdidas por usuario'), xlabel('Km'), ylabel('[dB]')

end 

