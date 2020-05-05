close all;clc; clear all;

 I =imread('cameraman.png');
 F1 = fftshift(fft2(I));

 [w,h] = size(I);

 %x=0:0.1:ws;
 x = linspace(0,w,w);
 y=gaussmf(x,[50 w/2]); 
 
 figure;plot(x,y);
 H2=conv2(y,y'); % yeni filtremiz oldu
 figure;surf(H2);
 
 If = F1.*H2;
 Iout = ifft2(fftshift(If));
 figure;imshow(uint8(Iout));
 
 %%%Highpass filter
 H3 = 1-H2;
 figure;surf(H3);
 If2= F1.*H3;
 Iout2 = ifft2(fftshift(If2));
 figure;imshow(uint8(Iout2));
 