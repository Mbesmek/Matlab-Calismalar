clear all; clc; close all;
I = double((imread('cameraman.png')));

kernel_y = [1 1 1;0 0 0;-1 -1 -1];
kernel_d = [-1 0 1;-1 0 1;-1 0 1];


[w,h]=size(I);
[r,c]=size(kernel_y);

I_prewit_x = zeros(w,h);
I_prewit_y = zeros(w,h);

for i=ceil(r/2):w-floor(r/2)
    for j=ceil(c/2):h-floor(c/2)
        
        block = I(i-floor(r/2):i+floor(r/2),j-floor(c/2):j+floor(c/2));
        I_prewit_x(i,j) =sum(sum(block.*kernel_y));
        I_prewit_y(i,j) =sum(sum(block.*kernel_d));
         
    end
end
% Iedge_x= (I_prewit_x>150)*255;
% Iedge_y= (I_prewit_y>150)*255;


figure;imshow(uint8(I));
figure;imshow(uint8(I_prewit_x));
figure;imshow(uint8(I_prewit_y));
