function [ MMSICHEoutput ] = MMSICHE_ALGO( x0 )
%% Histogram Calculation
L=256;
x=[0:1:L-1];
[m,n]=size(x0); 
len=m*n;
y=reshape(x0,len,1);   % m X N array into mn X 1
xpdf=hist(y,[0:L-1]); % pdf, 1 x L
%% Clipping Process
Tc=mean(xpdf);  % mean pixels for gray levels
Tc=round(Tc);
Ihist=zeros(1,256);   % intermediate histogram for clipping
 for i=1:256
     if xpdf(i)>Tc
     Ihist(i)=Tc;
     elseif xpdf(i)==0
           Ihist(i)=xpdf(i);
     else
         Ihist(i)=xpdf(i);
     end     
 end
%% To Calculate Xe(Median)
z=zeros(256,1);
totalpixels=sum(xpdf,2);
r=imhist(x0);
z(1)=r(1);
if(z(1)>=(round(totalpixels/2)))
    Xe=0;
else
for k=2:256
    z(k)=z(k-1)+r(k);
    if(z(k)>=(round(totalpixels/2)))
        Xe=k-1;
    break;
    end
    
end
end
%%  Mean Median Calculation
[g,h]=size(x0);
n_L1=sum(r(1:Xe+1));
P_L1=r(1:Xe+1)/n_L1;
n_U1=sum(r(Xe+2:256));
P_U1=r(Xe+2:256)/n_U1;
Z11=zeros(Xe+1,1); %lower hist
Z22=zeros(255-Xe,1); %upper hist
for u=1:g
    for t=1:h 
if (x0(u,t)<(Xe+1))
Z11(1)=0;
for k=2:(Xe+1)
    Z11(k)=Z11(k-1)+(P_L1(k).*(k-1));
end
else
    Z22(1)=(Xe+1)*P_U1(1);
for k=2:(255-Xe)
    Z22(k)=Z22(k-1)+(P_U1(k).*(Xe+k));
end
end
    end
end
Xbl=round(Z11(Xe+1));
Xbu=round(Z22(255-Xe));
%% Histogram sub division and equalizationThe
[w,l]=size(x0);
MMSICHEoutput=zeros(size(x0));          
C_Ll=zeros(1,Xbl+1);
n_Ll=sum(Ihist(1:Xbl+1));
P_Ll=Ihist(1:Xbl+1)/n_Ll;
C_Ll(1)=P_Ll(1);
for r=2:length(P_Ll)
    C_Ll(r)=P_Ll(r)+C_Ll(r-1);
end
if Xe~=Xbl
C_Ul=zeros(1,(Xe-Xbl));
n_Ul=sum(Ihist(Xbl+2:Xe));
P_Ul=Ihist(Xbl+2:Xe)/n_Ul;
end
if Xe~=Xbl
C_Ul(1)=P_Ul(1);
for r=2:(length(P_Ul))
    C_Ul(r)=P_Ul(r)+C_Ul(r-1);
end
end
C_Lu=zeros(1,Xbu-Xe);
C_Uu=zeros(1,(255-Xbu));
n_Lu=sum(Ihist(Xe+1:Xbu+1));
n_Uu=sum(Ihist(Xbu+2:256));
 P_Lu=Ihist(Xe+1:Xbu+1)/n_Lu;
 P_Uu=Ihist(Xbu+2:256)/n_Uu;
C_Lu(1)=P_Lu(1);
for r=2:length(P_Lu)
    C_Lu(r)=P_Lu(r)+C_Lu(r-1);
end
C_Uu(1)=P_Uu(1);
for r=2:(length(P_Uu))
    C_Uu(r)=P_Uu(r)+C_Uu(r-1);
end
for r=1:w                           %to obtain the 4 Equalized histograms 
    for s=1:l
        if x0(r,s)<(Xbl+1)
           f=Xbl*C_Ll(x0(r,s)+1);
           MMSICHEoutput(r,s)=round(f);
        else
            if (x0(r,s)>=(Xbl+1))&&(x0(r,s)<(Xe+1))
                f=(Xbl+1)+(Xe-Xbl+1)*C_Ul((x0(r,s)-(Xbl+1))+1);
                MMSICHEoutput(r,s)=round(f);
         
        else
            if (x0(r,s)>=Xe+1)&&(x0(r,s)<(Xbu+1))
                f=(Xe+1)+(Xbu-Xe+1)*C_Lu((x0(r,s)-(Xe+1))+1);
                MMSICHEoutput(r,s)=round(f);
            
        else
           f=(Xbu+1)+(255-Xbu+1)*C_Uu((x0(r,s)-(Xbu+1))+1);
           MMSICHEoutput(r,s)=round(f);
            end
            end
        end
    end
end
 
if strcmp(class(x0),'uint8')
    MMSICHEoutput = uint8(MMSICHEoutput);
elseif strcmp(class(x0),'uint16')
     MMSICHEoutput = uint16(MMSICHEoutput);
elseif strcmp(class(x0),'int16')
     MMSICHEoutput = int16(MMSICHEoutput);
elseif strcmp(class(x0),'single')
     MMSICHEoutput = single(MMSICHEoutput);
end
end