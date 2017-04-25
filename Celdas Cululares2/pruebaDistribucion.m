
close all
clear all
x0 = 0;
y0 = 0;
r = 10;
h = sqrt(3)/2 * r;
N = 5;
E = 10;
DELTA = 0.01;

x_l = [-r r r -r -r];
y_l = [h  h -h -h h]; 

x_l_D = [-r-E*DELTA r+E*DELTA r+E*DELTA -r-E*DELTA -r-E*DELTA];
y_l_D = [h+E*DELTA  h+E*DELTA -h-E*DELTA -h-E*DELTA h+E*DELTA]; 


[x, y] = distibucionUsuarios(x0, y0, N, r, DELTA);


hold on
plot(x, y, 'o')

plot(x_l, y_l)
plot(x_l_D, y_l_D)

dibujaHexagono( r, x0, y0);