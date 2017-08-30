clear all; close all; clc
a=imread('figuras.bmp');
[l,n]=bwlabel(a);
figure(1); imagesc(l); colormap(copper); impixelinfo
%figure(2); image(l); impixelinfo
%figure(3); imshow(l); impixelinfo
for i=1:n
    b=a*0;b(l==i)=1;area=sum(b(:));
    figure(2); imshow(b);
    title(['Area= ',num2str(area)]);
    pause
end