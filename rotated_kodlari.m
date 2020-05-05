clear all;close all;clc;

I = imread('lenna.jpg');

[w,h] =size(I);

for i = 1 : w
    for j = 1 : h
        I1(w-i+1,j) = I(i,j); %ters çevirme
        I2(i,h-j+1) = I(i,j); %aynalama 
        
    end
end
figure; imshow(I);
figure; imshow(I1);
figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(I2);
