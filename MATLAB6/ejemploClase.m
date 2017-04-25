%% Ejemplo clase

w = [-pi+0.001:0.001:pi-0.001];

x = ( cos(3*w)-cos(2*w) ) / ( 1 + cos( w ) )

figure(1)
stem(1:length(x), x)