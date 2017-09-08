clear all, close all, clc
a=imread('figuras2.bmp');
[fil,col,cap]=size(a); b=a;
if cap>1; a=rgb2gray(a); end;
ee=strel('square',15);
% 
% for i=1:10
%      a=imdilate(a,ee);
%      figure(1); imshow(a);
%      pause(1)
% end
% for i=1:10
%      a=imerode(a,ee);
%      figure(1); imshow(a);
%      pause(1)
% end
% c=imerode(a,ee);
% perimetro = a-c;
% figure(2); imshow(perimetro);


%erosion -> dilato = open (apertura)
%dilatar-> erosion = close (cierre)

c= imclose(a,ee);
d = imopen(a,ee);
figure(3); imshow([a,c,d]);


