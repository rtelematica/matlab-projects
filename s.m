
clear
clc
syms theta phi;

c2 = cos( pi/2 * cos( theta ) );
st = sin( theta );
sp = sin( phi );

s2 = sin( 5*pi/4 * st * sp);

se5 = sin(pi/4 * st * sp);


%f = ((cos(pi/2*cos(theta))*cos(pi/2*cos(theta)))/(sin(theta)))*((sin(5*pi/4*sin(theta)*sin(phi))*sin(5*pi/4*sin(theta)*sin(phi)))/(sin(pi/4*sin(theta)*sin(phi))));
%f = cos(pi/2*cos(theta));

f = 1
F = int( int( f, theta, 0, pi), phi, 0, 2*pi)


delta = 0.1;

x = [ 0 : delta : pi ];
y = [ 0 : delta : 2*pi ];

