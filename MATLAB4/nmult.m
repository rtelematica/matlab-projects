function y = nmult( vect, mult )

    acu = vect;
    c = 0;
  
    for i = 1 : length( acu )      
        for j = 1 : mult
            c( mult * i - ( mult -1) + j - 1) = acu( i );
        end
    end
  
    y = c;
end