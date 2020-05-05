close all; clear all;clc;

I =double(imread('cameraman.png'));

% k = [0 1 0;1 -4 1;0 1 0];
% k2 = [1 1 1;1 -8 1;1 1 1];

k = [-1 -2 -1;0 0 0;1 2 1];
k2 = [-1 0 1;-2 0 2;-1 0 1];
If1=conv2(I,k,'same');
If2=conv2(I,k2,'same');
If3=abs(If1)+abs(If2);
Iedge=(If3>180)*255;

% Isharped =I-If1;
% Isharped2 =I-If2;
figure;imshow(uint8(If1));
figure;imshow(uint8(If2));
figure;imshow(uint8(If3));

% figure;imshow(uint8(Isharped));
% figure;imshow(uint8(Isharped2));
