%% Principal

close all;
clear all;

r = 4000;
h = 0.862*r;
DELTA = 0.02;
esp = 3;  %N�mero par/impar
SIGMA = 9;
Lth = 70;
numUsuarios = 150;  %N�mero de usuarios contenidos en el hexagono

ITER = 1;

analisisPerdidasUsuario( r, DELTA, SIGMA, Lth, numUsuarios, ITER );