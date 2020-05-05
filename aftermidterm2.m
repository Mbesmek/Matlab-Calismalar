clear all;clc; close all;

I =imread('realmadrid.jpg');
% [w,h,z]=

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

figure;imshow(I);

% Iout = ((R>80)&(G<50)&(B<50))*255;

I2 = rgb2hsv(I);

H =I2(:,:,1);
S =I2(:,:,2);
V =I2(:,:,3);

Iout2 = ((H>0.2) & (H<0.5) &(S>0.45) & (S<0.9))*255; %sahayý bulma
figure;imshow(Iout2);

% figure;imshow(Iout);kýrmýzýlarý bulmak için yazmýþtýk sivas spor
% oyuncularý
% figure;imshow(H); title('r channel');
% figure;imshow(S); title('g channel');
% figure;imshow(V); title('b channel');






