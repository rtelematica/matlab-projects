

V = [1 2 3 4 5 6 7 8 9 10];
%I = [ 0.26 0.5 0.752 1.0 1.24 1.52 1.8 1.98 2.23 2.35];
%I = [81  160 240 300 390 450 510 610 688 766 ];
 %I = [ 75.2 150 226 301 376 451 526 602 677 752];
 
 %I = [84 170 230 330 426 500 572 670 720 834];
 
I = [ 82.1  164  246  328  410 492  574  657  739  821];




plot(I, V,'-o','LineWidth',2,...
                       'MarkerEdgeColor','b',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',8), 
title('Circuio 3: Voltaje / Corriente') ,
xlabel('Corriente [uA]'),
ylabel('Voltaje [V]');

grid on;