clc; clear all; close all;

I1 = imread('hinput2.jpg');
[w,h] = size(I1);
cdf = zeros(1,256);

histogram1 = histogram_hesapla(I1);
% histogram1=imhist(I1);
cdf(1) = histogram1(1);



%camulative hesabý 

for i = 2 : 1 : 256
    cdf(i) = (cdf(i-1) + histogram1(i));
end


cdf_min = cdf(1);

%LOOK UP TABLE=LUT
LUT = zeros(1,256);
for v = 1 : 1 : 256 %cdf elemanlarý v
    LUT(v) = round(((cdf(v)-cdf_min)/(w*h - cdf_min))*255);
end


I2 = zeros(w,h);

for i = 1 : 1  : w
    for j = 1 : 1 : h
        I2(i,j) = LUT(I1(i,j));
    end
end


figure;imshow(uint8(I1));  
figure;imshow(uint8(I2));
figure; plot(0:1:255,histogram1);
figure; plot(0:1:255,cdf);
figure; plot(0:1:255,LUT);



