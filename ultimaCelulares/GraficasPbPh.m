clear all; close all;

%% P0

lmbH=4;
lmbN=6;
s=35;
mu=180;
Pb=0;

for B=1:6
   
    Pb(B) = Pb_sisho (s,B-1,lmbN,lmbH,mu);
    
end    

B=[0:5];
plot(B,Pb,'m');

for B=1:6
   
    Pr(B) = Pfh_sisho (s,B-1,lmbN,lmbH,mu);
    
end    

B=[0:5];
hold on
plot(B,Pr,'g');


% Pb_s=[0.9470 0.9657 0.9674 0.9686 0.9697 0.9700];
% Pfh_s=[0.9468 0.9188 0.9164 0.9142 0.9127 0.9116];
% 
% hold on
% plot (B,Pb_s,'b');
% plot (B,Pfh_s,'b');
% hold on

simulacion()


