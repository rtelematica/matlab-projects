%% sss

w=[-1:0.01:1];
l=10;

x = sin(w*l/2)/sin(w/2)*exp(-1j*w*(l-1)/2);

figure(1)
plot(w, x);