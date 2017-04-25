%Den = [ 1.0000    1.5948    2.1945    1.7843    0.9940    0.3201 ];
%Num = [ 0.5660    1.3270    2.0508    2.0508    1.3270    0.5660 ];

Den = [ 6 5 4 3 2 1];
Num = [ 1 2 3 4 5 6];

[r,p,k] = residue(Num, Den)

ac = 0;
bc = 0;
a = 0;
b = 0;

l = length(r)

ind = 1;

if mod(l,2) == 0 
    display('Es par')
    
    for n = 1 : 2 : l-1        
        
        [bc, ac] = residue([r(n),r(n+1)],[p(n),p(n+1)],0);
        
        for i = 1 : length(bc)
            bc(i) = real(bc(i));
        end
        for i = 1 : length(ac)
            ac(i) = real(ac(i));
        end
        
        b(ind, 1:2) = bc
        a(ind, 1:3) = ac
        
        ind = ind + 1;

    end
    
else
    display('Es impar')
     
    for n = 1 : 2 : l-2
       
        [bc, ac] = residue([r(n),r(n+1)],[p(n),p(n+1)],0);
        
        for i = 1 : length(bc)
            bc(i) = real(bc(i));
        end
        for i = 1 : length(ac)
            ac(i) = real(ac(i));
        end        
        b(ind, 1:2) = bc;
        a(ind, 1:3) = ac;
        
        ind = ind + 1;

    end
    
     [bc, ac] = residue(r(l),p(l),0);

     b(ind, 1:2) = [0 bc] ;
     a(ind, 1:3) = [0 ac] ;
end

b
a
k
