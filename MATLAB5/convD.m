
%% 1
nxh = 0: 1 : 9;

x1 = ( 1 / 2 ).^n;
h1 = ( 1 / 4 ).^n;

yc1 = conv( x1, h1);

figure(1)

nc1=0:1:18;
stem(nc1, y), title('x[n] * y[n] = (1/2)^n (u[n] - u[n-10]) * (1/4)^n (u[n] - u[n-10])') ...
            , xlabel('n'), ylabel('Convolución');


%% 2

nx = 0 : 1 : 49;
nh = 0 : 1 : 9;

x2 = ( 1 / 2 ).^nx;
h2 = ( 1 / 4 ).^nh;

yc2 = conv(x2, h2);

figure(2);
nc2 = 0: 1 : 58;
stem(nc2, nc2), title('x[n] * y[n] = (1/2)^n (u[n] - u[n-50]) * (1/4)^n (u[n] - u[n-10])') ...
            , xlabel('n'), ylabel('Convolución');;

%%Graficas de x1, x2, h1, h2

figure(3)
stem(nxh, x1,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',5), title('x(n) = (1/2)^n u[n] - u[n-10]'), xlabel('n'), ylabel('Amplitud');

figure(4)
stem(nxh, h1,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',5), title('h(n) = (1/4)^n u[n] - u[n-10]'), xlabel('n'), ylabel('Amplitud');

figure(5)
stem(nx, x2,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',5), title('x(n) = (1/2)^n u[n] - u[n-50]'), xlabel('n'), ylabel('Amplitud');

figure(6)
stem(nh, h2,'--rs','LineWidth',2,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',5), title('h(n) = (1/4)^n u[n] - u[n-10]'), xlabel('n'), ylabel('Amplitud');

