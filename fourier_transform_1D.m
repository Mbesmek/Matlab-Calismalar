close all; clc; clear all;

i=-10:0.01:10;
t = 0.5;
x1 = 5*sin(2*pi*i*t);
x2 = 10*sin(2*pi*i*t);

x = x1+x2+20;
[n]= size(x,2);
noise = 10*(rand(1,n)-0.5);

xn = x+noise;

H = zeros(1,n);
H(985:1015)=1; %filtre oluþturduk
    
xf = fftshift(abs((fft(x))));
xnf = fftshift(abs((fft(xn))));
figure;plot(xf);
figure;plot(xnf);

xn_filtered = fftshift(abs(fft(xn))).*H;
x_rec =abs(ifft(fftshift(xn_filtered)));
figure;plot(x);
figure;plot(x_rec);



