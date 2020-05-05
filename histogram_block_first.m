
clc; clear all; close all;

Img = imread('hinput3.png');

%  adapthisteq(I);
 [w,h,z] = size(Img);
 
 threshold_number = ((w*h)*21.5)/100;

    e1=0;
e2=0;
e3=0;
e4=0;
 imshow(Img);
 
 Imgb1=Img(1:w/2,1:h/2);
 Imgb2=Img(w/2:w,1:h/2);
 Imgb3=Img(1:w/2,h/2:h);
 Imgb4=Img(w/2:w,h/2:h);
 
 Ihs=imhist(Imgb1);
 Ih1= histogram_hesapla(Imgb1);
 Ih2=imhist(Imgb2);
 Ih3=imhist(Imgb3);
 Ih4=imhist(Imgb4);

  
 for i=1:1:256
     Ih1(i)
         if (Ih1(i)>threshold_number)
             Ih1(i)=threshold_number;
            e1= e1+1;
         end
     
 end

  for i=1:1:256
         if (Ih2(i)>threshold_number)
             Ih2(i)=threshold_number;
             e2=e2+1;
         end
     
 end

 for i=1:1:256
         if (Ih3(i)>threshold_number)
             Ih3(i)=threshold_number;
            e3=e3+1;
         end
     
 end

 for i=1:1:256
         if (Ih4(i)>threshold_number)
             Ih4(i)=threshold_number;
            e4=e4+1;
         end
     
 end
    
 pk1=Ih1/sum(Ih1);
 pk2=Ih2/sum(Ih2);
 pk3=Ih3/sum(Ih3);
 pk4=Ih4/sum(Ih4);
 
%  Ihn1=Ih1+pk1*e1;  
%  Ihn2=Ih2+pk2*e2;  
%  Ihn3=Ih3+pk3*e3;  
%  Ihn4=Ih4+pk4*e4;
Ihnew1=zeros();
Ihnew2=zeros();
Ihnew3=zeros();
Ihnew4=zeros();
  
 for i=1:1:256
         if (Ih1(i)>threshold_number)
             Ihnew1(i)=Ih1(i);
         else
             Ihnew1(i)=Ih1(i)+(pk1(i)*e1);
         end
     
 end
  for i=1:1:256
         if (Ih2(i)>threshold_number)
             Ihnew2(i)=Ih2(i);
         else
             Ihnew2(i)=Ih2(i)+(pk2(i)*e2);
         end
     
  end
  for i=1:1:256
         if (Ih3(i)>threshold_number)
             Ihnew3(i)=Ih3(i);
         else
             Ihnew3(i)=Ih3(i)+(pk3(i)*e3);
         end
     
  end
   for i=1:1:256
         if (Ih4(i)>threshold_number)
             Ihnew4(i)=Ih4(i);
         else
             Ihnew4(i)=Ih4(i)+(pk4(i)*e4);
         end
     
   end
   
Iout=histogram_esitle(Imgb1,Ihnew1);
Iout2=histogram_esitle(Imgb2,Ihnew2);
Iout3=histogram_esitle(Imgb3,Ihnew3);
Iout4=histogram_esitle(Imgb4,Ihnew4);
% figure;imshow(uint8(Iout)),title('1'); 
% figure;imshow(uint8(Iout2)),title('2'); 
% figure;imshow(uint8(Iout3)),title('3'); 
% figure;imshow(uint8(Iout4)),title('4'); 
% figure, imshow(I(:,:,:,2))
figure;
subplot(2,2,1),imshow(uint8(Iout));
subplot(2,2,3),imshow(uint8(Iout2));
subplot(2,2,2),imshow(uint8(Iout3));
subplot(2,2,4),imshow(uint8(Iout4));
