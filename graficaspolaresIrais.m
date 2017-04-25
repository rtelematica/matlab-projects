
%% Graficas Polares IRAIS

% Dipolo doblado

tetha = [0:10:360];  % en grados
tetha = tetha *(pi/180);    % radianes

r = [55 60 54 30 40 45 65 55 70 80 65 55 41 50 36 65 75 50 20 35 14 5 12 5 50 20 15 20 15 5 9 15 17 32 11 20 22 ];

polar(tetha, r)
