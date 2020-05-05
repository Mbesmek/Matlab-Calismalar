function histogram1 = histogram_hesapla(I1)

    histogram1 = zeros(1,256);  
    [w,h] = size(I1);
    
    for i=1:1:w
        for j=1:1:h
        histogram1(I1(i,j)+1) = histogram1(I1(i,j)+1)+1;
        end
    end

end
     

