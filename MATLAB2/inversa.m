
H=0;
n=1000;
H(2:n) = 1;
H(1)=0;
H(n+1)=0;

h = fft(H);

plot(1:length(h), h)