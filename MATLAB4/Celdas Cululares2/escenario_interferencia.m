function r = escenario_interferencia( x0, y0, r, N, Nivel, DELTA )
%     x0 = 0;
%     y0 = 0;
% 
%     r = 800;
%     N = 1;
%     Nivel = 1; 
% 
%     DELTA = 0.1;

    h = sqrt(3)/2 * r;
    l = r / 2;

    %Calcuamos las coordenadas centrales de cada hexagono
    [aux_x, aux_y] = prueba_recursividad( x0, y0, Nivel, 1, r, h, l );

    %quitamos los repetidos
    ing = 1;

    h_x = aux_x(1);
    h_y = aux_y(1);

    for j = 2 : length(aux_x)

        for i = 1 : length(h_x)

            if aux_x(j) == h_x(i) & aux_y(j) == h_y(i)
                ing = 0;           
            end

        end

        if ing == 1
           h_x = [ h_x aux_x(j) ]; 
           h_y = [ h_y aux_y(j) ];

        end

        ing = 1;
    end

    h_x = [x0 h_x];
    h_y = [y0 h_y];

    %Determinamos las coordenadas de los usuarios para cada coordenada de los
    %hexagonos

    vecuser_x = 0;
    vecuser_y = 0;

    for i = 1 : length(h_x)

        [user_x, user_y] = distibucionUsuarios(h_x(i), h_y(i), N, r, DELTA);

        if i == 1
            vecuser_x = user_x;
            vecuser_y = user_y;

        else
            vecuser_x = [ vecuser_x ; user_x ];
            vecuser_y = [ vecuser_y ; user_y ];

        end

    end


    r = suma_Ganancias( x0, y0, h_x, h_y, vecuser_x, vecuser_y);
   
end
