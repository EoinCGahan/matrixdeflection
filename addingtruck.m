x=0.265
R2=85.264*(x)+25.988*(x+3.97)/4.5
R1=111.252-R2

if  (0< x)&&(x< 4.5)
    Fnode1+R1
    Fnode2+R2
end
    if 4.5< x < 9
        Fnode2+R1
        Fnode3+R2
    end
        if 9< x < 13.5
        Fnode3+R1
        Fnode4+R2
        end
        
        if 13.5< x < 18
        Fnode4+R1
        Fnode5+R2
        end
        if 18< x <22.5
         Fnode4+R1
        Fnode5+R2
        end
        if 22.5< x <27
         Fnode5+R1
        Fnode6+R2
        if 27< x <31.5
         Fnode6+R1
        Fnode7+R2
        end
        end