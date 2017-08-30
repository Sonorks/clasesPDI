clear all; close all; clc
a=imread('placa_bin.bmp');
[l,n]=bwlabel(a); areat=[];
%figure(1); imagesc(l); impixelinfo
%figure(2); image(l); impixelinfo
%figure(3); imshow(l); impixelinfo
for i=1:n
    b=a*0;b(l==i)=1;area=sum(b(:)); areat=[areat,area];
     if(area>1000)
         figure(2);imshow(b*255);
         title(['Area= ',num2str(area)]); placa=b;
         pause
     end
end
%figure(2); plot(areat); para ver la cantidad de objetos y su area
[x,y] = find(placa>0);
fm= min(x(:)); fM=max(x(:));
cm = min (y(:)); cM=max(y(:));
c=imread('carro (1).jpg'); c=imresize(c,0.2);
d=c(fm:fM,cm:cM,:);
figure(3); imshow(d);