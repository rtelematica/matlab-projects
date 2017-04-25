function alcance(v,theta)
clc
vx=v*cosd(theta); vy=v*sind(theta); g=9.8;
t=raiz(-g/2,vy,0);
t1=linspace(0,t);
y1=vy.*t1+0.5*(-g).*t1.^2;
x1=vx.*t1;
t2=max(t1);
s=vx*t2;
disp(s)
plot(x1,y1),grid
function t=raiz(a,b,c)
%calcula el tiempo de llegada al suelo 
t=(-b-sqrt(b^2-4*a*c)/(2*a));