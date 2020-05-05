close all; clear all;clc;

I =imread('cameraman.png');
In =imnoise(I,'salt & pepper',0.1);
[w,h]=size(I);
figure;imshow(uint8(I));


If2 =zeros(w,h); %median filter image
fs = 5;
for i=ceil(fs/2):1:w-floor(fs/2)
    
    for j=ceil(fs/2):1:h-floor(fs/2)
        
        
        block =In(i-floor(fs/2):i+floor(fs/2),j-floor(fs/2):j+floor(fs/2));
        block_id=reshape(block,1,fs*fs);
        block_id_sorted=sort(block_id);
%         disp(block);
%         disp(block_id);
%         disp(block_id_sorted);
%         pause
        if In(i,j)==0&&In(i,j)==255
            If2(i,j)=block_id_sorted(ceil((fs*fs)/2)); 
        else
            If2(i,j)=In(i,j);
        end
    end
end
     

figure;imshow(uint8(In));

figure;imshow(uint8(If2));