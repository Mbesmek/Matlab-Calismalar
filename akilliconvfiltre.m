clear all; close all; clc;

I1 = double(imread('barbara.png'));



k = ones(5,5);
k= k/25;

[w,h] = size(I1);
[kw,kh] = size(k);

kx = zeros(kw,kh);
T = 12;
  
for i = 1 : 1 : kw
    for j = 1 : 1 : kh
        
        kx(kw+1-i,kh+1-j) = k(i,j);
        
    end
end
        


[kw, hk] = size(k);

I2 = zeros(w,h);

for i = ceil(kw/2) : 1 : w - floor(kw/2)  % ceil yukarý floor aþaðý
    for  j = ceil(kw/2) : 1 : h - floor(kw/2)
        
        block = I1(i - floor(kw/2) :i + floor(kw/2),j- floor(kh/2):j+floor(kh/2)); %i,j orta nokta
        I2(i,j) = sum(sum(block.*kx));
        if abs(I2(i,j) - I1(i,j)) < T
            I3(i,j) = I2(i,j);
        else
            I3(i,j) = I1(i,j);
        end
    
    end
end



figure ; imshow(uint8(I1));
figure ;imshow(uint8(I2));title('normalfiltre');
figure ;imshow(uint8(I3));title('contolfiltre');
