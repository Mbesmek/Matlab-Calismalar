close all;clear all; clc;
I_org = double(imread('lenna.jpg'));

I = im2bw(imread('lenna.jpg'));

struct = ones(5,5);
struct2 = ones(11,11);

Ie = erosion(I,struct);
Id = dilation(Ie,struct2);

figure ;imshow(Ie);
figure ;imshow(Id);

I_org(:,:,1)=I_org(:,:,1)+Id*255;
figure ;imshow(Iorg);





