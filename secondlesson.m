clear all ; close all; clc;

A = [2 2 2 ; 1 1 -1 ; 2 3 1];
B = [12 ; 0 ; 11];
%x = inv(A)*B;


C = round(10*rand(5,5))

eig(C);%kare matrisin �zde�erini al�r

norm(C) %matrsin normunun 

inv(C) ; %tersini al�r

rank(C) ; %bir matrsin kare alt matrsinden determinant� s�f�rdan fark�l� olan t�r� en b�y�k matrsini t�r� 

[x y] = find(C==7);%c i�indeki 7 nin konumu verir

figure;plot(C);
figure;plot(C,'.') ;
figure;plot(C,'--vk');
figure;plot (C,'--g');;
figure;plot (C,'--og');
figure;plot(C*5,'--');

