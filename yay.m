function [result] =yay(Ib,ye)

[w,h]=size(Ib);

[w_ye,h_ye]=size(ye);
result=zeros(w,h);

for i=ceil(w_ye/2):w-floor(w_ye/2)
    for j=ceil(h_ye/2):w-floor(h_ye/2)
    
    blok=Ib(i-floor(w_ye/2): i+floor(w_ye/2),j-floor(h_ye/2):j+floor(h_ye/2));
    if(sum(sum(blok==ye))>0)
        result(i,j)=1;
    end
        
    end
        
end


