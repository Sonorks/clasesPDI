clear all, close all, clc
% for i=1:10
a=imread('carro (1).jpg'); a=imresize(a,0.2);
[fil,col,cap]=size(a);
%if cap>1; a=rgb2gray(a); end;
ee=strel('square',3); b=a;

% 
for i=1:20
    b=imdilate(b,ee);
    a=imerode(a,ee);
    figure(1); imshow([a,b]);
    pause
end
%      a=imerode(a,ee);
%      figure(1); imshow(a);
%      pause(1)
% end
% c=imerode(a,ee);
% perimetro = a-c;
% figure(2); imshow(perimetro);


%erosion -> dilato = open (apertura)
%dilatar-> erosion = close (cierre)
% 
% c= imclose(a,ee);
% d = imopen(a,ee);
% figure(3); imshow([a,c,d]);


