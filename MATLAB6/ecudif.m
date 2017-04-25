%% punto 2 y 3
%solucion Y[n] = 1/2(-1/2).^(n 


n = [0: 1 : 100];

y = -(-1/2).^(n + 1) * (1/2) + (1-(-0.5).^(n + 1))/(1.5);
%y2= 1/2 * (-1/2).^(n + 1) + 2/3;

figure(1)
stem(n, y), xlabel('n'), ylabel('Amplitud'), title('y = -(-1/2).^(n + 2) + 2/3');

%figure (2)
%stem(n, y2)


