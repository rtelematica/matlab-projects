

function codigo( c, n, f )

    if n == 0
        return
    end
    
    if f == 0
        
        display( c )        
        codigo( c, n - 1, 1 )
        codigo( c, n - 1 ,2 )
        
    elseif f == 1
        
        cc = [ c c ];
        display( cc )
        codigo( cc, n - 1, 1 )
        codigo( cc, n - 1, 2 )
        
        return
        
    elseif f == 2 
        cc = [ c -c ];
        display( cc )
        codigo( cc, n - 1, 1 )
        codigo( cc, n - 1, 2 )
        
    end   
    
end