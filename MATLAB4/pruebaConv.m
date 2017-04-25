
%% Prueba de la funcion convx_h (convolución de señales)

tx = [ -2 : 0.1 : 10 ];    % Tiempo para x
th = [ -2 : 0.1 : 10 ];     % Tiempo paa y

x = sin( 2*pi*1*tx );     % Función x
h = exp( th );            % Función h

y = conv( x, h );         % Convolución de las señales x e y usando la 
                        % función conv de MatLab
y1 = convx_h( x, h );      % Convolución de las señales x e y usando la
                        % función conv_h que se programo

% Se muestran las graficas de ambos resultados                  
figure(1)
subplot(2,1,1),stem(0:length(y)-1, y), title('Función conv de MatLab'), ylabel('Amplitud'), xlabel('n');
subplot(2,1,2),stem(0:length(y1)-1, y1), title('Función convx h Programada'), ylabel('Amplitud'), xlabel('n');

