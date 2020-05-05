function [result] = dilation(Ibinary,struct);

[w,h]=size(Ibinary);

[m,n]=size(struct);
result =zeros(m,n);
for i=ceil(m/2):1:w-floor(m/2)
    for j=ceil(n/2):1:h-floor(n/2)
        
        block = Ibinary(i-floor(m/2):i+floor(m/2),j-floor(n/2):j+floor(n/2));
                
        if(sum(sum(block==struct))>=1)
            result(i,j)=1;
        end
       
    end
end
        




end