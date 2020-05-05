
clc; clear all; close all;

Img = imread ('winterpic1.jfif');

 imhist(Img);
 [w,h] = size(Img);
 Ihist = zeros(1,256);

for i=1:1:w
    for j=1:1:h
        Ihist(Img(i,j)+1) = Ihist(Img(i,j)+1)+1;
    end
end

figure; plot(0:1:255,Ihist); xlabel('pixel intensivity');ylabel('number of pixel');
figure ; imshow(Img);

