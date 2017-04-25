
clear all;
t = [0 : pi/16 : 2*pi ];
f = [0 : pi/16 : pi ];

[T,F] = meshgrid(t, f);

% R = T.*sin( F );
R= ((cos(pi/2*cos(F)))./(sin(F))) .* ( ( sin( 5*pi/2*(1/2+ sin(F).*cos(T)))) ./ (( sin(pi/2*(1/2 + sin(F).*cos(T))))));         
%R = cos(pi/2*cos(T))./sin(T).*sin(5*pi/4*sin(T).*sin(F))./sin(pi/4*sin(T).*sin(F));
R=cos(pi/2.*cos(F))./sin(F);

x = R.*sin(F).*cos(T);
y = R.*sin(F).*sin(T);
z = R.*cos(F);
 
figure(2)
surfl(x,y,z);
shading interp;
colormap pink;
 
grid on;
axis equal;