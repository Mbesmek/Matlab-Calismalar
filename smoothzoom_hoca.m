clc; clear all; close all;

I = double(imread('lenna.jpg'));
[w,h] = size(I);

Izoom =zeros(2*w,2*h);

for i=1:1:w-1
    for j=1:1:h-1
        Izoom(2*i-1,2*j-1) = I(i,j);
        Izoom(2*i-1,2*j) = (I(i,j) + I(i,j+1))/2;
        Izoom(2*i,2*j-1) = (I(i,j) + I(i+1,j))/2;
        Izoom(2*i,2*j) = (I(i,j) + I(i,j+1) + I(i+1,j) + I(i+1,j+1))/4;
    end
end
figure;imshow(uint8(I));
figure;imshow(uint8(Izoom));