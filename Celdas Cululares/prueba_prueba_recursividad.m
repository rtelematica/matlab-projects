close all
clear all
r = 100;
N = 1;
DELTA = 0.01;



h = sqrt(3)/2 * r;
l = r / 2;
x0 = 0;
y0 = 0;
    
[aux_x, aux_y] = prueba_recursividad( x0, y0, 10, 3, 1, r, h, l );

%quitamos los repetidos
ing = 1;

x = aux_x(1);
y = aux_y(1);

for j = 2 : length(aux_x)
    
    for i = 1 : length(x)
        
        if aux_x(j) == x(i) & aux_y(j) == y(i)
            ing = 0;           
        end
        
    end
    
    if ing == 1
       x = [ x aux_x(j) ]; 
       y = [ y aux_y(j) ];
       
    end
    
    ing = 1;
end
C = 100;

x = [x x0];
y = [y y0];
%Colocamos usuarios

cor_ux = 0;
cor_uy = 0;

[u_x,u_y] = generaUsuarios( N, r, DELTA , x(1), y(1) );

cor_ux = u_x;
cor_uy = u_y;


for i = 2 : length(x)
    
    [u_x,u_y] = generaUsuarios( N, r, DELTA , x(i), y(i) );
    
    cor_ux = [ cor_ux ; u_x];
    cor_uy = [ cor_uy ; u_y];
    
end


%pintamos hexagonos
hold on
for i = 1 : length(x)
   
     dibujaHexagono( r, x(i), y(i));
     
end
 
%pintamos usuarios
lx = length(x)
for i = 1 : length(x)
   
     plot(cor_ux(i,:), cor_uy(i,:), 'o')
     
end


dibujaHexagono( r, 0, 0);