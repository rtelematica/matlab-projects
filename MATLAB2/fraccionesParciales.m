function [b1, a1] = fraccionesParciales(Num,Den)

    [r,p,k] = residue(Num, Den);

    ac = 0;
    bc = 0;
    a = 0;
    b = 0;

    l = length(r);

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

            b(ind, 1:2) = bc;
            a(ind, 1:3) = ac;

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

         b(ind, 1:2) = [bc 0];
         a(ind, 1:3) = [ac 0];
    end

     t = length(b(:,1));
 
     rel = 0;
     rel(1:t,:) = 0;
     b1 = [rel b];
 
     b1(t+1,:) = [ k 0 0];
     a(t+1,:) = [ 1 0 0];
     a1 = a;

end