clear all; close all; clc;

I1 = double(imread('cameraman.png'));

%I1 = double(imresize(uint8(I1),1000,1000));

%enhancment

k = ones(7,7);
k= k/49;
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

%matlab fonksyonlarý
 I3 = conv2(I1,k); %görüntü 2 boyutlu olmalý en hýzlý çalýþan bu oldu
 %I3 = conv2(I1,k,'same');

 I4 = imfilter(I1,k);

I5 = imfilter(I1,k,'symmetric');
I6 = imfilter(I1,k,'replicate');

figure ; imshow(uint8(I1));
figure ;imshow(uint8(I2));
% figure ; imshow(uint8(I3));
% figure ; imshow(uint8(I4));
% figure ; imshow(uint8(I5));
% figure ; imshow(uint8(I6));
