
A1 = [ 0.46 ];
B1 = [ 1, 0.64, 0.1024 ];

A2 = [ 0.46 ];
B2 = [ 1, 0.64, 0.1024 ];

figure( 1 )
[Hf1, Tf1] = freqz(A1, B2);
plot(Tf1, abs(Hf1))
xlabel('radianes / seg');
ylabel('Magnitud');

%figure( 2 )
%[Hf2, Tf2] = freqz(A2, B2);
%plot(Tf2, abs(Hf2))
%xlabel('radianes / seg');
%ylabel('Magnitud');