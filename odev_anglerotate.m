clear all; close all; clc;
img=imread('lenna.jpg'); 

[w,h]= size(img); 

angle=35;

rad=2*pi*angle/360;  

row=ceil(w*abs(cos(rad))+h*abs(sin(rad)));                      
col=ceil(w*abs(sin(rad))+h*abs(cos(rad)));                     

% black
C=uint8(zeros([row col]));



xo=ceil(w/2);              %original image center                                             
yo=ceil(h/2);

Ix=ceil(row/2);  %final image center
Iy=ceil(col/2);

for i=1:row
    for j=1:col                                                      

         x= (i-Ix)*cos(rad)+(j-Iy)*sin(rad);                                       
         y= -(i-Ix)*sin(rad)+(j-Iy)*cos(rad);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=w &&  y<=h ) 
              C(i,j)=img(x,y);  
         end

    end
end

figure; imshow(C);