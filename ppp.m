

u = [30 : 2 : 40];
p=[0.000420 0.001160 0.003150 0.008030 0.016070 0.029470];


hold on

grid on
plot(u, p)

plot(u,p, 'o')
title('Capacidad por celda en enlace de subida')
xlabel('Usuaros')
ylabel('P(BEER>0.001)')

