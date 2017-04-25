a = [1,2,3,4];
b = [1,2,3,4];
x = [1,2,3,4,5,6,7,8,9,10];

[r,p,k] = residue(b,a)

length(r)

[a1,b1] = residue(r(1), p(1), 0);
[a2,b2] = residue([r(2) r(3)], [p(2) p(3)], 0);


f1 = filter(b1, a1, x);
f2 = filter(b2, a2, x);
f3 = filter(k, 1, x);

f = f1 + f2 + f3
ff = filter(b,a,x)

