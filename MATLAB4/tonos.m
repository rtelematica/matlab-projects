


fm = 697;
t = [ 0: 1/fm : 1];

s = sin(2*pi*t);

stem(t, s)

sound(s, fm*2);
