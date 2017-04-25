%% Punto 4

%y[n] +0.5Y[n-1] = x[n]

x = 1;
Y_A = 0.5;

%Y = 0 : 1 : 100;

for i = 0 : 100
   
    Y( i + 1 ) = x - 1/2 * Y_A;
    
    Y_A = Y( i + 1 );
    
end

n = [0:1:100];

figure(2)
stem(n, Y)
