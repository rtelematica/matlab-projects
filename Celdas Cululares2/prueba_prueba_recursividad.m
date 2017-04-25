close all
clear all

r = 200;
N = 5;
Nivel = 1; 

DELTA = 1;

h = sqrt(3)/2 * r;
l = r / 2;
x0 = 0;
y0 = 0;


%Calcuamos las coordenadas centrales de cada hexagono
% [aux_x, aux_y] = prueba_recursividad( x0, y0, Nivel, 1, r, h, l );
% 
% %quitamos los repetidos
% ing = 1;
% 
% x = aux_x(1);
% y = aux_y(1);
% 
% for j = 2 : length(aux_x)
%     
%     for i = 1 : length(x)
%         
%         if aux_x(j) == x(i) & aux_y(j) == y(i)
%             ing = 0;           
%         end
%         
%     end
%     
%     if ing == 1
%        x = [ x aux_x(j) ]; 
%        y = [ y aux_y(j) ];
%        
%     end
%     
%     ing = 1;
% end
% 
% x = [x x0];
% y = [y y0];

x = [ 0 0 3/2*r 3/2*r 0 -3/2*r -3/2*r ];
y = [ 0 2*h h -h -2*h -h +h];

%Determinamos las coordenadas de los usuarios para cada coordenada de los
%hexagonos

vecuser_x = 0;
vecuser_y = 0;

for i = 1 : length(x)

    [user_x, user_y] = distibucionUsuarios(x(i), y(i), N, r, DELTA);
    
    if i == 1
        vecuser_x = user_x;
        vecuser_y =user_y;
        
    else
        vecuser_x = [ vecuser_x user_x ];
        vecuser_y = [ vecuser_y user_y ];
        
    end
     
end

hold on


%Dubujamos los hexagonos
for i = 1 : length(x)
  
    dibujaHexagono( r, x(i), y(i));
    
end

%dibujamos los usuarios
plot(vecuser_x, vecuser_y, 'o')
title('Simulacion de celdas con 30 usuarios')
xlabel('m')
ylabel('m');

%dibujamos las antenas
plot(x, y, 'x')

%dibujaHexagono( r, 0, 0);