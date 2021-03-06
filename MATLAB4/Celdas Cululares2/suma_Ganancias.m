
function res = suma_Ganancias( x0, y0, h_x, h_y, vu_x, vu_y)

    %Determinamos la posicion de la aantena x0, y0 dentro de los vectores
    %h_x, h_y
    pos_Antena = 0;
    for i = 1 : length(h_x)
        if x0 == h_x(i) && y0 == h_y(i)
            pos_Antena = i;
        end
       
    end
    
    
    I_S = 0;

    i_user2 = 0;  
    l_ = length(vu_x(:,1));
    
    for j_user = 1 : length(vu_x(:,1))
        
        act_voz = 0;
        for us = 1 : length(vu_x(1,:))
            
            if rand() < 0.3750
                act_voz = act_voz + 1;
            end
        end
        
        
        
        %for i_user = 1 : length(vu_x(1,:))
        for i_user = 1 : act_voz
            
            %Calculamos la ganancia de canal para cada usuario en todas las
            %antenas
            Gc_elegida = 0;
            num_Antena = 0;
            for ant = 1 : length(h_x)
                d_ant = sqrt((h_x(ant)-vu_x(j_user, i_user))^2+(h_y(ant)-vu_y(j_user, i_user))^2);
                Gc_aux = 10^(8*rand()/10)*(d_ant)^-4;
                
                if Gc_aux > Gc_elegida
                    
                    Gc_elegida = Gc_aux;
                    num_Antena = ant;
                    
                end
                
            end            
            
            if num_Antena ~= pos_Antena
                
                %Se calcula la distancia del movil visto a la antena origen
                ro = sqrt((x0-vu_x(j_user, i_user))^2 + (y0-vu_y(j_user, i_user))^2);
                Go = 10^(8*rand()/10)*(ro^-4);
                
                %Se calcula la distancia del movil visto a la antena que le
                %da cobertura               
                rj = sqrt((h_x(num_Antena)-vu_x(j_user, i_user))^2 + (h_y(num_Antena)-vu_y(j_user, i_user))^2);
                Gj = 10^(8*rand()/10)*(rj^-4);
                
                I_S_aux = Go/Gj;
                
                I_S = I_S + I_S_aux;
                
                
            end                                          
             
        end     
    end
    
    
    res = I_S;
end