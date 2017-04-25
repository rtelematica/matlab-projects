clear all;
close all;
w=-pi:0.01:pi
hm=sqrt(1./(1-cos(w)+1/4));
figure(1)
plot(w,hm)
n=0:19;
h=(0.5).^n;
figure(2)
stem(n,h)
H=0;
for n=0:10
    H=H+h(n+1)*exp(-j*w*n);
    
end
figure(1)
hold on
plot(w,abs(H),'r*')
%filtrando
n=0:100
x=cos(pi/2*n)+cos(pi/4*n);
y=conv(x,h);
figure(3)
stem(x)
figure(4)
stem(y,'b')
X=0
for n=0:length(x)-1
    X=X+x(n+1)*exp(-j*w*n);
end
figure(5)
plot(w,abs(X))
Y=0
for n=0:length(x)-1
    Y=Y+y(n+1)*exp(-j*w*n);
end
figure(6)
plot(w,abs(Y))

