
n=[-20:0.5:20];

x_n=sin(0.08*pi*n);
x1_n=sin(16.08*pi*n);
x2_n=sin(32.08*pi*n);

figure(1)
stem(n, x_n), title('x[n] = sin(0.08*pi*n)'), xlabel('n'), ylabel('Amplitud')

figure(2)
stem(n, x1_n), title('x1[n] = sin(16.08*pi*n)'), xlabel('n'), ylabel('Amplitud')

figure(3)
stem(n, x2_n), title('x2[n] = sin(32.08*pi*n)'), xlabel('n'), ylabel('Amplitud')

