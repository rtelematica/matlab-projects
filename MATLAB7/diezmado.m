%implemntar un diezmador
% y interpolar en matlab
M=4;
x=1:20;
for k=0:length(x)-1
    if mod(k,M)==0
        y(k/M+1)=x(k+1)
        pause;
    end;
end;
y 
yy=x(1:M:length(x))