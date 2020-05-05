clear all;clc; close all;


k=ones(5,5);
[x y]=size(k);
f=integralImage(k)
f=f(2:end,2:end) %crop image



