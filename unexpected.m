
clc; clear all; close all;

Img = imread ('reservuardogs.jpg');
Img = rgb2gray(Img);
 imhist(Img)
 [w,h] = size(Img);
 w
 h
 Img= reshape(Img,w,h);
 
 Ihist = zeros(1,256);

 theMedian = median(Img(:))
 level = graythresh(Img)
% level = 0.3829;
 BW = imbinarize(Img,level);
 figure, imshow(BW),title('BW')
 Ibin=(Img>theMedian)*255;
 figure;imshow(Ibin),title('bu da benimki asdsf')
 
for i=1:1:w
    for j=1:1:h
        Ihist(Img(i,j)+1) = Ihist(Img(i,j)+1)+1;
    end
end

figure; plot(0:1:255,Ihist); xlabel('pixel intensivity');ylabel('number of pixel');
figure; imshow(Img);

