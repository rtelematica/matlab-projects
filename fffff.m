
x = [1,2,3,4,5,6,7,8,9,10];

b = [-1.308717392625970   0.752762699478450
   0.383484735423555   1.282826410173036
                   0   1.119677101646859];
               


a =[ 1.000000000000000  -0.588389112720284   0.533265013936724
   1.000000000000000   0.751390398450519   0.466246596955297
                   0   1.000000000000000   0.670332047603097];


k =0.166666666666667;


Den = [ 6 5 4 3 2 1];
Num = [ 1 2 3 4 5 6];


f1 = filter([-1.308717392625970   0.752762699478450],[1.000000000000000  -0.588389112720284   0.533265013936724],x);
f2 = filter([0.383484735423555   1.282826410173036],[1.000000000000000   0.751390398450519   0.466246596955297],x);
f3 = filter([1.119677101646859],[1.000000000000000   0.670332047603097],x);
f4 = filter(k,1,x);

f = f1 + f2 + f3 + f4
ff = filter(Num,Den, x)