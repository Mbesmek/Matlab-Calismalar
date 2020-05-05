%Iorginal---->dct --> quantization --> entropycoding---->Icompression
clear all;clc;close all;
 
I = imread('cameraman.png');
%org_block = I(100:107,100:107);

maske = [1 1 1 1 0 0 0 0;
         1 1 1 1 0 0 0 0;
         1 1 1 1 0 0 0 0;
         1 1 1 1 0 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0];  %quantalama matrisi kalite parametresini belirliyor
     
figure;imshow(I);
% figure;imshow(org_block);
[w h] =size(I);

for i=1:8:w-8
    for j= 1:8:h-8
        
        org_block = I(i:i+7,j:j+7);
        dctblock=round(dct2(org_block)); %dct ald�k
        quan_block = dctblock.*maske;
       
        rec_block = abs(round(idct2(quan_block))); %ters d�n���m yapt�k elimizdeki 9 veriden original g�r�nt�y� elde edicez
        I2(i:i+7,j:j+7) =rec_block;

    end
end

 figure;imshow(uint8(I2));

% 1'lerin say�s� artt�k�a kalite artacak


%64/9 s�k��t�rd�k
