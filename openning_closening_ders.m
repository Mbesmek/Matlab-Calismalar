clear all; close all; clc;

% binary iki görüntü yüklendi geçen hafta ki koddan
 Ib = double(imread('lenna.jpg'));
% load I1;
% load Iout2;
% Ib= Ib==255;

ye=[1 1 1; 1 1 1 ; 1 1 1]
ia=asindir(Ib,ye);

