
%% Prueba de la funcion convx_h (convoluci�n de se�ales)

tx = [ -2 : 0.1 : 10 ];    % Tiempo para x
th = [ -2 : 0.1 : 10 ];     % Tiempo paa y

x = sin( 2*pi*1*tx );     % Funci�n x
h = exp( th );            % Funci�n h

y = conv( x, h );         % Convoluci�n de las se�ales x e y usando la 
                        % funci�n conv de MatLab
y1 = convx_h( x, h );      % Convoluci�n de las se�ales x e y usando la
                        % funci�n conv_h que se programo

% Se muestran las graficas de ambos resultados                  
figure(1)
subplot(2,1,1),stem(0:length(y)-1, y), title('Funci�n conv de MatLab'), ylabel('Amplitud'), xlabel('n');
subplot(2,1,2),stem(0:length(y1)-1, y1), title('Funci�n convx h Programada'), ylabel('Amplitud'), xlabel('n');

