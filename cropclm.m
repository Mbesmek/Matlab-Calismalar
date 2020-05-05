 close all; clc; clear all;
 I = imread('lenna.jpg');
 
 [w,h] = size(I);
 

 
%  for i = 1: 1: w-100
%      for j =1 :1 :h-100
%          
%          Icrop(i,j) = I(i+100,j+100);
%      end
%  end
%  
 Icrop = I([200:511],[150:300]);
 figure ;imshow ( I([200:511],[150:300]));