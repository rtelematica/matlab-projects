 N=50;n=0:N-1;L=6;M=L*N;
  x = sin(2*pi*0.14*n)+ sin(2*pi*0.21*n);
 % Generar la secuencia del up-sampler
  xu = zeros(1,M);
  n1 = 1:M;
  xu([1:L:M]) = x;
  figure;stem(n,x);
  figure;stem(n1,xu);hold;
 % Frecuencia de corte del filtro pasobajo = pi/6 --> 1/12
  Nf=30;nf=Nf/2;
  B = fir1(Nf,1/6);
  y = filter(6*B,1,xu);
 % Desplazar a la izquierda el vector 'y'
  y(1:M-nf) = y(nf+1:M); y(M-nf+1:M) = zeros(1,nf);
  plot(n1,y,'r');zoom;
  [H,F] = freqz(B,1,250,6);
  figure;semilogy(F,abs(H));zoom;
  %http://www.tecnun.es/asignaturas/tratamiento%20digital/tema11.pdf