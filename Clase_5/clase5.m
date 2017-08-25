clear all; close all; clc
a = imread('carro (1).jpg'); a= imresize(a,0.2);
[fil,col,cap]=size(a); b1=a(:,:,3); b1=255-b1;
b=reshape(a,[fil,col*cap]);
c=rgb2hsv(a); c=c*255; s=uint8(c(:,:,2));
d=reshape(c,[fil,col*cap]);
cform=makecform('srgb2lab');
f=applycform(a,cform); g= reshape(f,[fil,col*cap]);
b2=f(:,:,3);
a1=min(s,b2);
a2=max(s,b2);
a3=double(s).*double(b2);
a3=normaliza(a3);
a4=double(s)./double(b2);
a4=normaliza(a4);
figure(1); imshow(a); impixelinfo
figure(2); imshow(b); impixelinfo
figure(3); imshow(c/255); impixelinfo
figure(4); imshow(d/255); impixelinfo
figure(5); imshow([b;d]); impixelinfo
figure(6); imshow([b1,s]); impixelinfo
figure(7); imshow(f); impixelinfo
figure(8); imshow(g); impixelinfo
figure(9); imshow([s,b2]); impixelinfo
figure(10); imshow([a1,a2;a3,a4]); impixelinfo
a5=a3;a5(a5<150)=0;
figure(11); imshow(a5); impixelinfo