clear all; close all; clc;

I1 = double(imread('cameraman.png'));


a = 4
k = 1/8*[-a -a -a ; -a 8*(a+1) -a ; -a -a -a];
k
[w,h] = size(I1);
[kw,kh] = size(k);

kx = zeros(kw,kh);
  
for i = 1 : 1 : kw
    for j = 1 : 1 : kh
        
        kx(kw+1-i,kh+1-j) = k(i,j) ;
        
    end
end
        

[kw, hk] = size(k);

I2 = zeros(w,h);

for i = ceil(kw/2) : 1 : w - floor(kw/2)  % ceil yukarý floor aþaðý
    for  j = ceil(kw/2) : 1 : h - floor(kw/2)
        
        block = I1(i - floor(kw/2) :i + floor(kw/2),j- floor(kh/2):j+floor(kh/2)); %i,j orta nokta
        I2(i,j) = sum(sum(block.*kx));
        
    end
end



figure ; imshow(uint8(I1));
figure ;imshow(uint8(I2));

