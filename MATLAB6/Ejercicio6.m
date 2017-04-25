n = 0:99;
fs = 5000;
fo = 500;
xn = sin(2*pi*(f0/fs)*n)

figure(1)
stem(n, xn), title('x[n]=sin(2*pi*(fo/fs)*n); fs = 5000Hz - fo = 500Hz'), xlabel('n'), ylabel('Amplitud');


n = 0:99;
fs = 5000;
f0 = 2000;
xn = sin(2*pi*(f0/fs)*n)

figure(2)
stem(n, xn), title('x[n]=sin(2*pi*(fo/fs)*n); fs = 5000Hz - fo = 2000Hz'), xlabel('n'), ylabel('Amplitud');

n = 0:99;
fs = 5000;
f0 = 3000;
xn = sin(2*pi*(f0/fs)*n)

figure(3)
stem(n, xn), title('x[n]=sin(2*pi*(fo/fs)*n); fs = 5000Hz - fo = 3000Hz'), xlabel('n'), ylabel('Amplitud');

n = 0:99;
fs = 5000;
f0 = 4500;
xn = sin(2*pi*(f0/fs)*n)

figure(4)
stem(n, xn), title('x[n]=sin(2*pi*(fo/fs)*n); fs = 5000Hz - fo = 4500Hz'), xlabel('n'), ylabel('Amplitud');


n = 0:99;
fs = 50000;
f0 = 2000;
xn = sin(2*pi*(f0/fs)*n);

figure(5)
stem(n, xn), title('x[n]=sin(2*pi*(f0/fs)*n); fs = 5000Hz - fo = 2000Hz'), xlabel('n'), ylabel('Amplitud');