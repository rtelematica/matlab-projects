
function r = escenario_interferencia2( x0, y0, r, N,DELTA, act_v, ra )

    h = sqrt(3)/2 * r;

    h_x = [ 0 0 3/2*r 3/2*r 0 -3/2*r -3/2*r ];
    h_y = [ 0 2*h h -h -2*h -h h];
 

    %Determinamos las coordenadas de los usuarios para cada coordenada de los
    %hexagonos

    vu_x = 0;
    vu_y = 0;

    for i = 1 : length(h_x)

        [user_x, user_y] = distibucionUsuarios(h_x(i), h_y(i), N, r, DELTA);

        if i == 1
            vu_x = user_x;
            vu_y = user_y;

        else
            vu_x = [ vu_x ; user_x ];
            vu_y = [ vu_y ; user_y ];

        end

    end


    %r = suma_Ganancias( x0, y0, h_x, h_y, vecuser_x, vecuser_y);
    
    I_S = 0;

    for j_user = 1 : length(vu_x(:,1))
        
       act_voz = 0;
       
       if j_user == 1
           act_voz = act_v;
       else
           
           for us = 1 : length(vu_x(1,:))

               if rand() < 0.3750
                   act_voz = act_voz + 1;
                   
               end
           end
       end
        
    
%        for i_user = 1 : length(vu_x(1,:))
       for i_user = 1 : act_voz
                    
            %Calculamos la ganancia de canal para cada usuario en todas las
            %antenas
            Gc_elegida = 0;
            num_Antena = 0;
            for ant = 1 : length(h_x)
                d_ant = sqrt((h_x(ant)-vu_x(j_user, i_user))^2+(h_y(ant)-vu_y(j_user, i_user))^2);
                Gc_aux = 10^(8*rand()/10)*((d_ant)^-4);

                if Gc_aux > Gc_elegida

                    Gc_elegida = Gc_aux;
                    num_Antena = ant;

                end
            end            

            if num_Antena ~= 1

                %Se calcula la distancia del movil visto a la antena origen
                ro = sqrt((x0-vu_x(j_user, i_user))^2 + (y0-vu_y(j_user, i_user))^2);
                Go = 10^(8*rand()/10)*(ro^-4);

                %Se calcula la distancia del movil visto a la antena que le
                %da cobertura               
                rj = sqrt((h_x(num_Antena)-vu_x(j_user, i_user))^2 + (h_y(num_Antena)-vu_y(j_user, i_user))^2);
                Gj = 10^(8*rand()/10)*(rj^-4);

                I_S_aux = Go/Gj;    %Gc_elegida;
%                     if I_S_aux > 1
%                         u = u + 1;
%                     end
                I_S = I_S + I_S_aux;
                
            end                                          
        end     
    end
    
    r = I_S;
   
end
