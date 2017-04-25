clc
 clear all
  close all
A= imread('evita1.bmp');
y = double(A);
[x,y]=size(A);
h=[0 1 0;1 1 1;0 1 0]
[x,y]=size(A);
[x,y]=size(h);
for X=1:x;
    for Y=1:y;
                    S(X,Y)=A(x,y).*h(x,y);
  
    end
end
figure(1)
h = fspecial('unsharp');
I2 = imfilter(A,h);
imshow(S), title('original')
figure, imshow(I2), title('Filtered Image')