clc
clear all
close all

w=512;
h=512;
f=fopen('C:\Users\FERHAT\Desktop\matlab\lena_gray.raw','r');

 i = fread(f);
 i = reshape(i,w,h);
 status=fclose(f);

figure; imshow(uint8(i'));
figure; imshow(imhist(i))