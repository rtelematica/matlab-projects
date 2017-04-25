
close all
x1 = [ 1 1 1 1 1 1 1 1];
x2 = [ 1 1 0 0 1 1 0 0 ];

X1 = fftshift(fft(x1, 1024));
X2 = fftshift(fft(x2, 1024));

c = zeros(1,1024);

hold on
plot(0 : length(X1)-1,X1)
plot(0 : length(X2)-1,X2)
plot(0 : 1023, c)