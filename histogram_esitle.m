function I2 = histogram_esitle(Iblock,Ihist)
[w,h] = size(Iblock);
cdf = zeros(1,256);

cdf(1) = Ihist(1);



%camulative hesabý 

for i = 2 : 1 : 256
    cdf(i) = (cdf(i-1) + Ihist(i));
end


cdf_min = cdf(1);

%LOOK UP TABLE=LUT
LUT = zeros(1,256);
for v = 1 : 1 : 256 %cdf elemanlarý v
    LUT(v) = round(((cdf(v)-cdf_min)/(w*h - cdf_min))*255);
end


I2 = zeros(w,h);

for i = 1 : 1  : w
    for j = 1 : 1 : h
        I2(i,j) = LUT(Iblock(i,j));
    end
end
end