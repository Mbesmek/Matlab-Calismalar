close all; clear all;clc;

f =imread('cameraman.png');

h = f([109:153,188:213]);
[fx,fy]=size(f);
[hx,hy]=size(h);

hm = mean2(h);

B = sum(sum((h-hm).^2));
r =zeros(fx,fy);

figure;imshow(uint8(f));
figure;imshow(uint8(h));

for x = ceil(hx/2):1:floor(hx/2)
    for y = ceil(hy/2):1:floor(hy/2)
        
        fblock=f(x-floor(hx/2):x+floor(hx/2),y-floor(hy/2):y+floor(hy/2));
        fbm = mean2(fblock);
        A =0;
        for i=1:1:hx
            for j=1:1:hy
                
               A = A +((h(i,j)-hm)*f(i,j)-fbm);
            end
        end
        C = sum(sum((fblock-fbm).^2));
        
        r(x,y) = A/ sqrt(B*C);

    end
end

figure;imshow(r);
[p1,p2]=find(r==max(max(r)));
I2=f;
I2(p1-floor(hx/2):p1+floor(hx/2),p2-floor(hy/2):p2+floor(hy/2))=0;
figure;imshow(I2);

