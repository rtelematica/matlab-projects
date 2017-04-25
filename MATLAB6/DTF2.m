%% Practica "Transformada Directa de Fourier"

clear all, clc, close all;

%PASO 2

Na = 400;
L=4;
ka = [1: Na - 1]; 
xa_k = sin(pi * ka * L / Na )./sin(pi * ka / Na) .* exp(-i*pi*ka*(L-1)/Na);

figure(1)
stem(0: length(xa_k)-1, abs(xa_k))

%PASO 4

N = 8;

unos = ones(1,4);

ceros = zeros(1, N - 4);

xn = [unos, ceros];

figure(2)
stem(0:length(xn)-1, xn);

x_k = zeros(1, N);

for k = 0: N - 1
    
    for n = 0 : N - 1
        
        x_k(k + 1) =  x_k( k + 1 ) + xn(n+1) * exp(-i*2*pi*k*n/N);
        
    end
end


%PASO 5
figure(3)
stem(0: 1: length(x_k) - 1, abs(x_k));
