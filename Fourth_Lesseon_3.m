% komþuluk iþlemleri
clear all; close all; clc;

I1 = imread('cameraman.tif');

n = 2;

init_pos = 256 / 2^(n+1)
step_size = 256 / 2^n;

figure; imshow(I1);
