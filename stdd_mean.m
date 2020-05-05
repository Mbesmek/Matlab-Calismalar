clc; clear all; close all;

I = imread('barbara.png');
[w,h] = size(I);


Ip2 = I(141:181,372:433);
Ip1 = I(359:453,47:131);


m1 = mean2(Ip1);
m2 = mean2(Ip2);

s1 = std2(Ip1);
s2 = std2(Ip2);

