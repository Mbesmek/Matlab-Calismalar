clear all; clc; close all;

I = imread('lenna.jpg');

[w,h] = size(I);

m = 50;
n = 40;

for i=1:1:w-m
    for j=1:1:h-n
        Ishift (i+m,j+n) = I(i,j);
    end
end
figure; imshow(I);
figure;imshow(Ishift);

        
