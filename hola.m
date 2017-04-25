function [W,F] = specwin(w,M)

% w es el vector del que hay que calcular su DTFT
% M es el número de frecuencias en las que se quiere calcular la DTFT
% W es la DTFT de w
% F es el vector de frecuencias digitales 0 <= F <= 0.5
w=[2 3 4 5 6 7 8];
M=100;
N=length(w);
W=zeros(1,M);
F=0:(M-1);F=F/(2*M);

for i=1:N,
	W=W+w(i)*exp(-j*2*pi*i*F);
end

W=W/N;

Wlog=20*log10(abs(W));
plot(F,Wlog);grid;zoom;
return