clear all;
%Ecuacion 1: Pr/Pt = Gt*Gr*( c/(4*pi*f*d))^2

f = 1900 * 10^6;
Gt = 1; 
Gr = 1;
ht = 5;
hr = 5;
Pt = 1;
c = 3 * 10^8;
d = [ 100 : 0.1 : 10000 ];

Pr1 = Pt * Gt * Gr * ( c ./ ( 4 * pi * f * d ) ).^2;   

%Pr1 en decibeles
Pr1_dB = 10 * log10( Pr1 );

figure( 1 )
plot( d, Pr1_dB )

lambda = c/f;

Pr3 = Pt * 4 * ( c ./ ( 4 * pi * f * d ) ).^2 * Gt * Gr .* ( sin( 2 * pi * ht * hr ./ ( lambda .* d ) ) ).^2;   

Pr3_dB = 10 * log10( Pr3 );

figure( 2 )
plot( d, Pr3_dB )


Pr4 = Pt * Gt * Gr * ( ht * hr ./ d.^2 ).^2;   

Pr4_dB = 10 * log10( Pr4 );

figure( 3 )
plot( d, Pr4_dB )