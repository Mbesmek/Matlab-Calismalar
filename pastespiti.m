clear all; close all; clc;
I=imread('pas-ornek4.jpg');
% figure; imshow(I);
R=I(:,:,1);
% figure; imshow(R);

T = adaptthresh(R,0.2);
BW = imbinarize(R,T);
I2=edge(BW,'sobel');
figure;
imshowpair(I, I2, 'montage');
