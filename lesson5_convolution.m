clear all; close all; clc;

I1 = double(imread('cameraman.png'));

%k = [-1 -1 -1 ; 0 0 0 ; 1 1 1]; %yatayda tespit ettik
k = [1 0 -1 ; 2 0 -2 ; 1 0 -1]; %dikeydeki pixelleri tespit ettik

[w,h] = size(I1);
[kw,kh] = size(k);

kx = zeros(kw,kh);
% [kw, kh] = size(k); 

%kerneli ters �eviriyoruz
for i = 1 : 1 : kw
    for j = 1 : 1 : kh
  
        kx(kw+1-i,kh+1-j) = k(i,j) ;
        
    end
end

I2 = zeros(w,h);

for i = ceil(kw/2) : 1 : w - floor(kw/2)  % ceil yukar� floor a�a��,mesela 5 boyutlu bir kernelse 3.pixele de�er yaz�caz o y�zden kw/2 yap�yoruz
    
    for  j = ceil(kw/2) : 1 : h - floor(kw/2)
        %i-kw/2 ��nk� 3-2 den 1.pixele eri�iyorum  i-1 den j+1 e
        block = I1(i-floor(kw/2) : i+floor(kw/2) , j-floor(kh/2) : j+floor(kh/2)); %i,j orta nokta i�lem yapaca��m k�sm� croplayal�m
        I2(i,j) = sum(sum(block .* kx));
        
    end
end



figure ; imshow(uint8(I1));
figure ; imshow(uint8(I2));

