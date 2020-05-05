close all; clc; clear all;

I =imread('cameraman.png');
[w,h]=size(I);

F1 = fftshift(fft2(I));

figure;
surf(abs(F1));
figure;
surf(fftshift(abs((F1)))); %merkez düþük frekans yanlar=yüksek frekans

H = zeros(w,h); 
ws=25;
H(round(w/2-ws):round(w/2+ws),round(h/2-ws):round(h/2+ws))=1;
figure;
surf(H); %kare merkezde olmalý

If = F1.*H;
Iout = ifft2(fftshift(If));

figure;imshow(uint8(Iout));

%kenar bilgilerini kaybettik
