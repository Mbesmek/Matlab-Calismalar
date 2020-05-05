% cdf(v) = round((cdf(v) - cdfmin)/((MxN) - cdfmin)*(L-1))

clear all; close all; clc;

I1 = imread("cameraman.png");
%I3 = (I1+5)*2;
[w,h] = size(I1);
cdf = zeros(1,256);

histogram1 = histogram_hesapla(I1);
%histogram3 = histogram_hesapla(I3);

cdf(1) = histogram1(1);

%cdf_min_ok = 0;

for i = 2 : 1 : 256
    cdf(i) = (cdf(i-1)+histogram1(i));
    %if cdf_min_ok == 0 && cdf(i)~= 0

    %end
end

figure; plot(histogram1);
figure; plot(cdf);

cdf_min = cdf(1);

LUT = zeros(1,256);
for v = 1 : 1 : 256
   LUT(v) = round(((cdf(v)-cdf_min)/(w*h - cdf_min))*255);
end

I2 = zeros(w,h);

for i = 1 : 1 : w
    for j = 1 : 1 : h
        I2(i,j) = LUT(I1(i,j));
    end
end

figure;imshow(uint8(I2));
figure; plot(0:1:255,histogram1);
figure; plot(0:1:255,cdf);
figure; plot(0:1:255,LUT);




