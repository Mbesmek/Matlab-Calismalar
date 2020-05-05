clear all; clc; close all;

I = imread('lenna.jpg');

[w,h] = size(I);

m = 60;
n = -80;

Itemp = ones(3*w,3*h);

Itemp(w+1+m:2*w+m,h+1+n:2*h+n) = I;


Ishift = Itemp(w+1:2*w,h+1:2*h);
figure;imshow(uint8(I)); 
figure;imshow(uint8(Ishift));
