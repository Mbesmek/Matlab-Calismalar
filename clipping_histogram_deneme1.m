clc
clear all
close all 
x0=imread('winterpic1.jfif');  
if(size(x0,3)~=1)
    x0 = rgb2gray(x0);
    x0=uint8(x0);
end
MMSICHEoutput=MMSICHE_ALGO(x0);
subplot(1,2,1,'align');imshow(x0,[]);xlabel('Original');
subplot(1,2,2,'align');imshow(MMSICHEoutput,[]);xlabel('MMSICHE')