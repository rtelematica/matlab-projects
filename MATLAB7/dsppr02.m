n=-20:20;
Xn=cos(pi*n/2)-sin(pi*n/8)+3*cos(pi*n/4+pi/3);
Xn1=cos(pi*n/2);
Xn2=-sin(pi*n/8);
Xn3=3*cos(pi*n/4+pi/3);

figure(1);
subplot(3,1,1);
stem(n,Xn);

subplot(3,1,2);
stem(n,Xn2);

subplot(3,1,3);
stem(n,Xn3);

figure(2);
stem(n,Xn);

