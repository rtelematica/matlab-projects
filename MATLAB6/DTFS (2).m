
w = [-100 : 0.001 : 100];

%Xwa = ( 1 - exp( -1 * sqrt(-1) * 5 * w ));
%Xwb = ( 1 - exp( -1 * sqrt(-1) * w ) );

Xw = 1 + exp(-i*w) + exp(-2*i*w) + exp(-3*i*w) + exp(-4*i*w);
figure(1)
plot( w , abs(Xw));

Xn = ones( 1, 5 );
Xw2 = fft( Xn, 1024 );

figure(2);
plot(0: length(Xw2) - 1, abs(Xw2));
