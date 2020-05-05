close all; clear all; clc;

 A = zeros(1,3600);
 
 i = linspace(0,3600,500);                       % 0 ile 3600 arasýna 500 elaman dizi oluþturur.
 
 A = sind(i);
 B = cosd(i);
 figure;
 plot(i,A,'-');                                % x y eksenini bu þekilde çizdirebiliriz. ilk parametre satýr ikinci sütun                                           % x ve y 'nin boyutlar eþit olmalýdýr !!!!
 hold on;                                      % çizilen plotu figure üzerinde tutar yeni gelenleri üzeri çizer.
 plot(i,B,'-')
 plot(i,A+B,'-')
  title('sinus');                               % Figure'e baþlýk ekler                          
  xlabel('degree');                             % X ekseninin hangi deðiþkeþ olduðunu gösterir.
  ylabel('sin(degree)');                       % Y ekseninin hangi deðiþkeþ olduðunu gösterir.
  
figure;legend('sin','cos','sin+cos')                 % Hangi grafiðin hangi deðere ait olduðunu gösterir. 
text(50,0,'Jellyfish')
% 
 figure;
 subplot(3,2,1);plot(i,A,'-')                  % subplot figure'ü bölmek için kullanýlýr.
 subplot(3,1,2);plot(i,B,'-')
 subplot(3,1,3);plot(i,A+B,'-.')

C = round(rand(20,20)*30);

figure;bar3(C)                                       % 3 boyutlu bar grafiði oluþturur
figure;surf(C)                                       % 3 boyutlu çizim
figure;mesh(C)                                       % 3 boyutlu çizim

