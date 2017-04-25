clear all;
t = [0:0.005:2];
f = 3;
x = sin(2*pi*f*t);

figure(1)
plot(t, x);

xF = fft(x, 500);
fff = -250: 249
plot(fff, abs(xF))

