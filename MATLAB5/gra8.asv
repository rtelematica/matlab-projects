function[t]=gra8(fm)
%La funcion escuni genera un escalon unitario con duracion D/2, en donde D
%es la duracion total de mi vector escu.

%   t -> Vector tiempo
%   escu -> Vector con el escalon unitario
%   fm -> frecuencia de muestreo
%   D -> Duracion total de la señal

%t=0:1/fm:D+(1/fm);
t=0:1/fm:0.4;
y=sin(2*pi*2.5*t);
subplot(4,2,1),plot(t,y,'r*-');
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Sin (t)');

y2=2*y;
subplot (4,2,3),plot(t,y2,'');
xlabel('tiempo(s)');
ylabel('Amplitud');
title('2*Sin (t)');

y2=3*y;
subplot (4,2,5),plot(t,y2);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('3*Sin (t)');


y2=4*y;
subplot (4,2,7),plot(t,y2);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('4*Sin (t)');

%%columna dos
y=sin(2*pi*2.5*t);
subplot(4,2,2),plot(t,y);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Sin (t)');

y=sin(2*pi*2.5*2*t);
subplot(4,2,4),plot(t,y);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Sin (2t)');


y=sin(2*pi*2.5*3*t);
subplot(4,2,6),plot(t,y);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Sin (3t)');


y=sin(2*pi*2.5*4*t);
subplot(4,2,8),plot(t,y);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Sin (4t)');