
clc; clear all; close all;

Img = imread ('pic1.jpeg');
Img = rgb2gray(Img);
[x y]=size(Img);

Img= reshape(Img,x,y);,

g=integralImage(Img);
g =g(2:end,2:end); %crop

T=zeros(x,y);
w=7;
k=-0.0001;
d=round(w/2);
LMD=ones(w,w); %local mean deviation

for i=d+1:1:x-w
   for j=d+1:1:y-w
    s=(g(i+d-1,j+d-1)+g(i-d,j-d))-(g(i-d,j+d-1)+g(i+d-1,j-d));  %local mean  
    m=s/(w*w);  %arithmetic mean
    LMD=Img(i-d:i+d-1,j-d:j+d-1)-m;
    T(i-d:i+d-1,j-d:j+d-1)=LMD;
    end
end
figure,imshow(T)
