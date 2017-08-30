clear all; close all; clc
a = imread('carro (1).jpg'); a=imresize(a,0.2);
[a1,a2,a3,a4,a5,a6,s,b,y] = componentes(a);
%figure(1); imshow([a1;a2;a3]); impixelinfo
%figure(2); imshow([a4;a5;a6]); impixelinfo
figure(3); imshow([s,b,y]); impixelinfo
c=s; c(c<180)=0; c(c>0)=255;
figure(4); imshow(c); impixelinfo
d=min(s,y);
e=d; e(e<180)=0; e(e>0)=255;
figure(5); imshow(e); impixelinfo
imwrite(e,'placa_bin.bmp');