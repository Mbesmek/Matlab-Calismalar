clc; clear all; close all;

I = imread('seeds.jpg');
figure;imshow(I)
T = 110;
Ibin = (I>T)*255;
Inegative = 255-I;



figure;imshow(Ibin);
figure;imshow(Inegative );