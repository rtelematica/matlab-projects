%% sss

f = [-3:0.01:3];
w=2*pi*f;
l=10;

x = sin(w*l/2)/sin(w/2)*exp(-1j*w*(l-1)/2);

figure(1)
plot(1:length(x), x);