
%Se define una función rectangular f(t) com:

%                    |  1   ( 0 < t < pi )
%             f(t) = |
%                    | -1   ( pi < t < 2pi )

delta = 0.01;
tp = [ 0 : delta : pi ];
tn = [ pi + delta : delta : 2 * pi ];

f = [ ones(1, length( tp ) ) , -1 * ones( 1, length( tn ) ) ];
t = [ tp, tn];

% Funcion seno donde se a calculado el valor optimo que reduce al minimo el
% error cuadratico medio de la aproximación (4/ pi).
fs = 4 / pi * sin( t );

plot( t, f, t, fs )
title('Aproximación de una funcion rectangular mediante sen (t)')
xlabel( '0 \leq t \leq 2\pi' )
ylabel( 'f(t)' )
set( gca, 'XTick', 0 : pi / 2 : 2 * pi )
set( gca, 'XTickLabel', {'0','pi/2','pi','3pi/2','2pi'})
h = legend( 'rect', 'sin(t)');
set( h, 'Interpreter', 'none');


% En el ejercicio anterior, se hizo un aproximacion a la funcion
% rectangular mediante una sola funcion sen(t). Se observara que e tiene
% una mejor aproximacion cuando se emplea un gran numero de funciones
% mutuamente ortogonales.Es bien sabido que las funciones sin(nw0t) y
% sin(mw0t) son mutuamente orotogonales en el intervalo ( t0, t0 + 2pi/w0)
% para todos los valores enteros de n y m. Por tanto, se deduce que un
% conjunto de funciones sin(t), sin(2t), sin(3t), sin(4t), etc, es
% mutuamente orotogonal en el intervalo (0, 2pi). A continuacion se hará
% una aproximacion a la funcion rectangular mediante una serie finita de
% funciones sinusoidales
%
%
%      f(t)~= C1 sin(t) + C2 sin(2t) + C3 sin(3t) + ... + Cn sin(nt) 
%
% donde:
%            | 4/pi*r   si r es impar
%       Cr = |
%            | 0        si r es par
%
%
%
% Así, f(t) queda aproximada por
%
%       f(t)~= 4/pi ( sin(t) + 1/3sin(3t) + 1/5sin(5t) + ... )
%
% El error que e obtiene para esta aproximacion es:
%
%
%          e = 1/2pi * [ 2pi - pi(4(pi*r) ], donde r es el numero de
%          funciones que se tienen en la aproximacion
%

%Ecuacion general
% n = ?;
% fs = 0;
% e = 0;
% for r = 1 : 2 :n
%     
%     fs = fs + 1 / r *sin( r * t );
%     e = e + 4 /( pi * r );
%     
% end
% 
% error = 1 /( 2 * pi ) * ( 2 * pi - e );

% figure(2)
% plot( t, f, t, fs )
% title('Aproximación de una funcion rectangular mediante n funciones sen (nt): e = ')
% xlabel( '0 \leq t \leq 2\pi' )
% ylabel( 'f(t)' )
% set( gca, 'XTick', 0 : pi / 2 : 2 * pi )
% set( gca, 'XTickLabel', {'0','pi/2','pi','3pi/2','2pi'})
% h = legend( 'rect', 'sin(t)');
% set( h, 'Interpreter', 'none');

% APROXIMACION MEDINTE n FUNCIONES
n = 1;
n = 2*n-1
fs = 0;
e = 0;
for r = 1 : 2 :n
    
    fs = fs + 1 / r *sin( r * t );
    e = e + (4 /( pi * r ))^2;
    
end
fs = 4 / pi * fs; 

n
error = 1/(2*pi)*(2*pi-pi*e)

figure(2)
plot( t, f, t, fs )
title('Aproximación de una funcion rectangular mediante funciones sen (nt):' )
xlabel( '0 \leq t \leq 2\pi' )
ylabel( 'f(t)' )
set( gca, 'XTick', 0 : pi / 2 : 2 * pi )
set( gca, 'XTickLabel', {'0','pi/2','pi','3pi/2','2pi'})
h = legend( 'rect', 'sin(t)');
set( h, 'Interpreter', 'none');

 



