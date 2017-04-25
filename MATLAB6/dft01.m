clear all; close all; clc;
%DFT
N=100
x1=[1,1,1,1]
L=length(x1);
xn=[x1,zeros(1,N-L)]
X=zeros(1,N);
for k=0:N-1
    for n=0:N-1
   
        X(k+1)=X(k+1)+xn(n+1)*exp(-j*2*pi*k*n/N);
        
    end
end
X
stem(0:length(X)-1,X);
%IDFT
xnn=[zeros(1,N)];
for n=0:N-1
    for k=0:N-1
   
        xnn(n+1)=xnn(n+1)+(1/N)*X(k+1)*exp(j*2*pi*k*n/N);
        
    end
end

xnn=xnn(1,1:L)