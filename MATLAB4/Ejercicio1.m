
%% Graficas Ejercicio 1 Tarea 1

n = [ -15 : 15 ];

x1 = cos(9*pi*n);
x2 = cos((20/105)*pi*n);

n3 =[-15: 1/pi : 15];
x3 = cos(7*n3);
x4 = cos((90/100)*pi*n);

n5 =[-30: 1/sqrt(pi) : 50];
x5 = cos((90/100)*n5);

figure(1)
subplot(3,2,1), stem(n, x1), title('a) x[n] = cos(9*pi*n)'), ylabel('x[n]'), xlabel('n');
subplot(3,2,2), stem(n, x2), title('b) x[n] = cos(20/105*pi*n)'), ylabel('x[n]'), xlabel('n');
subplot(3,2,3), stem(n3, x3), title('c) x[n] = cos(7*n)'), ylabel('x[n]'), xlabel('n');
subplot(3,2,4), stem(n, x4), title('d) x[n] = sen(90/100*pi*n)'), ylabel('x[n]'), xlabel('n');
subplot(3,1,3), stem(n5, x5), title('e) x[n] = sen(90/100*n)'), ylabel('x[n]'), xlabel('n');

figure(2)
stem(n5, x5)
