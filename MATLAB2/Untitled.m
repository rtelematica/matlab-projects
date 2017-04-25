clear all;
clc;

q=0:pi/100:pi/2;
w=0*q;
subplot(2,3,1); plot(q,w,'red','LineWidth',2);
xlabel('Posición')

axis([0 2*pi -5 30])
hold on;
grid on;

e=pi/2:pi/100:pi;
i=(25/2)*((1+cos((pi*e)/(pi/2)))-(0.25*(1-cos((2*pi*e)/(pi/2)))));
plot(e,i,'red','LineWidth',2);

t=pi:pi/100:3*pi/2;
y=25+0*t;
plot(t,y,'red','LineWidth',2);

u=3*pi/2:pi/100:2*pi;
r=(25/2)*((1-cos((u*pi)/(pi/2)))-(0.25*(1-cos((2*u*pi)/(pi/2)))));
plot(u,r,'red','LineWidth',2);

hold off;

%-------------------------------------------------------

subplot(2,3,2); plot(q,w,'blue','LineWidth',2);
xlabel('Velocidad')

axis([0 2*pi -40 40])
hold on;
grid on;

d=pi/2:pi/100:pi;
f=25*(-sin(2*d)-0.5*sin(4*d));
plot(d,f,'blue','LineWidth',2);

plot(t,w,'blue','LineWidth',2);

u=3*pi/2:pi/100:2*pi;
i=25*(sin(2*u)-0.5*sin(4*u));
plot(u,i,'blue','LineWidth',2);

hold off;

%-------------------------------------------------------

subplot(2,3,4); plot(q,w,'green','LineWidth',2);
xlabel('Aceleración')

axis([0 2*pi -120 70])
hold on;
grid on;

d=pi/2:pi/100:pi;
f=50*(-cos(2*d)-cos(4*d));
plot(d,f,'green','LineWidth',2);

plot(t,w,'green','LineWidth',2);

u=3*pi/2:pi/100:2*pi;
i=50*(cos(2*d)-cos(4*d));
plot(u,i,'green','LineWidth',2);

hold off;

%-------------------------------------------------------

subplot(2,3,5); plot(q,w,'yellow','LineWidth',2);
xlabel('Golpeteo')

axis([0 2*pi -300 300])
hold on;
grid on;

d=pi/2:pi/100:pi;
f=100*(sin(2*d)+2*sin(4*d));
plot(d,f,'yellow','LineWidth',2);

plot(t,w,'yellow','LineWidth',2);

u=3*pi/2:pi/100:2*pi;
i=100*(-sin(2*d)+2*sin(4*d));
plot(u,i,'yellow','LineWidth',2);

hold off;

%-------------------------------------------------------

q=0:pi/100:pi/2;
w=0*q+30;
subplot(2,3,3); plot(q,w,'red','LineWidth',2);
xlabel('Perfil de la Leva (Rectangular)')

axis([0 2*pi 25 60])
hold on;
grid on;

e=pi/2:pi/100:pi;
i=(25/2)*((1+cos((pi*e)/(pi/2)))-(0.25*(1-cos((2*pi*e)/(pi/2)))))+30;
plot(e,i,'red','LineWidth',2);

t=pi:pi/100:3*pi/2;
y=25+0*t+30;
plot(t,y,'red','LineWidth',2);

u=3*pi/2:pi/100:2*pi;
r=(25/2)*((1-cos((u*pi)/(pi/2)))-(0.25*(1-cos((2*u*pi)/(pi/2)))))+30;
plot(u,r,'red','LineWidth',2);

hold off;

%-------------------------------------------------------

subplot(2,3,6); polar(q,w);
xlabel('Perfil de la Leva (Polar)')

hold on;
grid on;

polar(e,i);

polar(t,y);

polar(u,r);