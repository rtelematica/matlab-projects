%% Código (a)

% X[n]=a^n, n>=0,va>1
% Ex= 1/(1-a^2)  
% Si a=0.5, Ex= 4/3
% Comprobación numérica

format long;

a=0.5;
n=0:10;
Ex1= sum(abs(a.^n).^2)

n=0:100;
Ex2= sum(abs(a.^n).^2)

n=0:10000;
Ex3= sum(abs(a.^n).^2)


%% Código (b)

s=0:10;
Ex4= sum(abs(sin(3*pi*s/16)).^2)

s=0:100;
Ex5= sum(abs(sin(3*pi*s/16)).^2)

s=0:10000;
Ex6= sum(abs(sin(3*pi*s/16)).^2)

%% Código (c)

t=-10:10;
Ex7=sum(abs(a.^(abs(t))).^2)

t=-100:100;
Ex8=sum(abs(a.^(abs(t))).^2)

t=-10000:10000;
Ex9=sum(abs(a.^(abs(t))).^2)

%% Límite
q=