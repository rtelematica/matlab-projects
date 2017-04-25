close all
clear all

r = 5;
h = 0.866 * r;
l = r / 2;
    
x0 = 1;
y0 = 1;


xl = x0 + l;
xl_ = x0 - l;

xr = x0 + r;
xr_ = x0 - r;
 
yh = y0 + h;
yh_ = y0 - h;

%Coordendas x de los puntos Pi
hexa_x = [ xl_, xl, xr, xl, xl_, xr_ ];

%Coordenadas y de los puntos Pi
hexa_y = [ yh, yh, y0, yh_, yh_, y0 ];

patch( hexa_x, hexa_y, 'g');