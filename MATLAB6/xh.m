
%%

x = [1, 2, 4];
h = [1, 1, 1, 1, 1];

xh2 = xcorr(x, h);
hx2 = xcorr(h, x);

t = -1:1:7;
stem(t, xh2)

