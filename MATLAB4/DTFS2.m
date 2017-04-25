%% DTFS

clear all;
close all;

%Xwa = ( 1 - exp( -1 * sqrt(-1) * 5 * w ));
%Xwb = ( 1 - exp( -1 * sqrt(-1) * w ) );

%Xw = 1 + exp(-i*w) + exp(-2*i*w) + exp(-3*i*w) + exp(-4*i*w);

for k = -20 : 20
    
    if k == 0
   
    %Ck = 1/5*(1 - exp(-i*2*pi*k))./(1-exp(-i*2/5*pi*k));
    Ckk ( 21 ) = 1/2;
    
    else
            Ck = 1/10*(1 - exp(-i*pi*k))./(1-exp(-i*2/10*pi*k));
            Ckk(k + 20+ 1) = Ck;
    end

end

figure(1)
stem( -20 : 20 , abs(Ckk));

w = [-10 : 1 : 10];

%Xwa = ( 1 - exp( -1 * sqrt(-1) * 5 * w ));
%Xwb = ( 1 - exp( -1 * sqrt(-1) * w ) );

Xw = 1 + exp(-i*w) + exp(-2*i*w) + exp(-3*i*w) + exp(-4*i*w);
%figure(1)
%plot( w , abs(Xw));



Xn1 = ones( 1, 5 );
Xn0 = zeros( 1, 5);

Xn = [ Xn1, Xn0, Xn1, Xn0, Xn1, Xn0];

Xw2 = fftshift(fft( Xn, 100 ));

figure(2);
stem(0: length(Xw2) - 1, abs(Xw2));