clc; clear all ; close all;

I=imread('lenna.jpg');
[w h]=size(I);

for i=1:w
    for j=1:h
       % I2(j,w-(i-1))=I(i,j); transpose
      % I2(h-i+1,j)=I(i,j); mirror according to x axsis
     % I2(i,w-j+1)=I(i,j); mirror  according yo y axsis 
     
  
    end
end
I2=I(50:300,200:500);
figure, imshow(I),title('org');
  figure, imshow(I2),title('rotated');
  