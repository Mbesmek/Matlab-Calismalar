close all; clear all; clc;

 A = zeros(1,3600);
 
 i = linspace(0,3600,500);                       % 0 ile 3600 aras�na 500 elaman dizi olu�turur.
 
 A = sind(i);
 B = cosd(i);
 figure;
 plot(i,A,'-');                                % x y eksenini bu �ekilde �izdirebiliriz. ilk parametre sat�r ikinci s�tun                                           % x ve y 'nin boyutlar e�it olmal�d�r !!!!
 hold on;                                      % �izilen plotu figure �zerinde tutar yeni gelenleri �zeri �izer.
 plot(i,B,'-')
 plot(i,A+B,'-')
  title('sinus');                               % Figure'e ba�l�k ekler                          
  xlabel('degree');                             % X ekseninin hangi de�i�ke� oldu�unu g�sterir.
  ylabel('sin(degree)');                       % Y ekseninin hangi de�i�ke� oldu�unu g�sterir.
  
figure;legend('sin','cos','sin+cos')                 % Hangi grafi�in hangi de�ere ait oldu�unu g�sterir. 
text(50,0,'Jellyfish')
% 
 figure;
 subplot(3,2,1);plot(i,A,'-')                  % subplot figure'� b�lmek i�in kullan�l�r.
 subplot(3,1,2);plot(i,B,'-')
 subplot(3,1,3);plot(i,A+B,'-.')

C = round(rand(20,20)*30);

figure;bar3(C)                                       % 3 boyutlu bar grafi�i olu�turur
figure;surf(C)                                       % 3 boyutlu �izim
figure;mesh(C)                                       % 3 boyutlu �izim

