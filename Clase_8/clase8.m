clear all, close all, clc
% a = imread('figuras2.bmp');
% b = bwmorph(a,'skel',inf);
% figure(1); imshow([a,b]);
% original = imread('rice.png');
% figure, imshow(original)
% se = strel('disk',12);
% c = imopen(original,se);
% figure, imshow(c);
% tophatFiltered = imtophat(original,se);
% figure, imshow(tophatFiltered)
% contrastAdjusted = imadjust(tophatFiltered);
% figure, imshow(contrastAdjusted)
original = imread('pout.tif');
se = strel('disk',3);
d = imclose(original,se);
figure, imshow(d);
contrastFiltered = ...
    imsubtract(imadd(original,imtophat(original,se)),...
    imbothat(original,se));
figure, imshow(original)
figure, imshow(contrastFiltered)