close all; clc; clear all;

I = imread ('lenna.jpg');
% [w,h] = size(I);


Ib = I+50 ;
Ic = I*3.6;
Icb = I*5+50;

figure;imshow(I),title('org');
figure;imshow(Ib),title('br');
figure;imshow(Ic),title('ct');
figure;imshow(Icb),title('br ct');