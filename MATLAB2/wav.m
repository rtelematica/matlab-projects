%% Practica *.wav




[y,f] = wavread('coldplay_long');

tf=fft(y);

lft=floor(length(tf)/2);
tf=tf(1:lft);
%Eje de frecuencia
ft=(0:lft-1)*(f/2)/(lft-1);

figure(1)
%subplot(2,1,1), plot(t,xpt);
subplot(2,1,2), plot(ft,abs(tf));

%%filtro
[a,b]=butter(2,[1000,3000]/(f/2));
yf = filtfilt(a,b,y);