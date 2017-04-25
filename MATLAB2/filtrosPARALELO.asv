%b =[-0.0539    0.1184
%     0.1616    0.3311
%          0    0.3166];


%a =[1.0000    0.1827    0.8613
%    1.0000    0.7727    0.5812
%         0    1.0000    0.6395];
%b = [-0.0539 0.1185 
%      0.1617  0.3310
%           0  0.3165];
%       
% a = [ 1 0.1827 0.8611
%       1 0.7726 0.5813
%       0  1  0.6395];      
%  
%  
% k = 0.5660;

%b =[ 0     0
%     0     0
%     0     0];


%a =[ 1.0000             2.2976             1.2021          
%   1.0000             0.2541             1.0882          
%        0             1.0000            -0.5517 + 1.2533i];


%k = 1;

b = [-1.308717392625970   0.752762699478450
   0.383484735423555   1.282826410173036
                   0   1.119677101646859];
               


a =[ 1.000000000000000  -0.588389112720284   0.533265013936724
   1.000000000000000   0.751390398450519   0.466246596955297
                   0   1.000000000000000   0.670332047603097];


k =0.166666666666667;
   
numFil = length(b(:,1))

x = [1,2,3,4,5,6,7,8,9,10];
y = 0;
yc = 0;

orden = 0;
a_a = 0;
b_b = 0;

for n = 1 : numFil
    
    %Se determina el orden para b(n)
    orden = length(b(n,:));
    b_b=0;
    b_b = b(n,1:orden)
    
    for i = 1 : length(b(n,:))
        if b(n,i) == 0 %decrementamos 1            
            b_b = 0;
            b_b = b(n,1+i:orden);
        end
    end       
    %Se determina el orden para b(n)
    orden = length(a(n,:));
    a_a = 0;
    a_a = a(n,1:orden)            
    for i = 1 : length(a(n,:))
        if a(n,i) == 0 %decrementamos 1            
            a_a = 0;
            a_a = a(n,1+i:orden);            
        end
    end
    a_a
    pause()
   
    yc = yc + filter (b_b,a_a,x);
    %y(n,1:length(x)) = yc;
    
end
 
%y(numFil+1,1:length(x)) = filter(k,1,x);
yc = yc + filter(k,1,x);

%Sumamos las posiciones
% c = 0;
% r = 0;
% for n = 1 : length(y(1,:))
%     for i = 1 : length(y(:,1))
%       c = c + y(i,n);  
%       
%     end
%     r(n) = c;
%     c = 0;
% end

yc

Den = [ 6 5 4 3 2 1];
Num = [ 1 2 3 4 5 6];

s = filter(Num,Den,x)