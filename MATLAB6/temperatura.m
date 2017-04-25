

temp = [36.256, 36.897, 36.456, 36.444, 37.000, 36.987, 36.455, 36.444, 36.345];

promTemp = 36.879;

figure(1)
stem(1:length(temp), temp);

t = [1:10];
h = exp(2*pi*i*t);

y = conv(temp, h);


figure(2)
stem(1:length(y), y);

y = y/9.37;


figure(3)
stem(1:length(y), y);
