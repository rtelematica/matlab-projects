close all;

%graficar usando FFT
Xn=ones(1,5);
Xw=fftshift(fft(Xn,1024));
plot(0:length(Xw)-1,abs(Xw));

figure(1);
xlabel('Muestras de frecuencia');
ylabel('Magnitud');
title('DTFT calculado con la fft sin normalizar el eje de frecuencia');

figure(2);
w=-pi:2*pi/length(Xw):pi-2*pi/length(Xw);
plot(w,abs(Xw));
xlabel('radianes/segundo');
ylabel('Magnitud');
title('DTFT calculado con la fft normalizando el eje de frecuencia');
