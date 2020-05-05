clc; clear all; close all;

I = imread('lenna.jpg');
[w,h] = size(I);

Izoom =zeros(2*w,2*h);

for i=1:1:w
    for j=1:1:h
        Izoom(2*i-1,2*j-1) = I(i,j);
        Izoom(2*i-1,2*j) = I(i,j);
        Izoom(2*i,2*j-1) = I(i,j);
        Izoom(2*i,2*j) = I(i,j);
    end
end
figure;imshow(I);
figure;imshow(uint8(Izoom));