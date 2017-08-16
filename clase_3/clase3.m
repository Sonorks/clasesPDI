clear all; close all; clc
a = imread('nal.jpg');
b=rgb2gray(a);
figure(1); imshow(b); impixelinfo;
for i=1:5:200
    c = b-i;
    figure(2); imshow(c); title(['i= ',num2str(i)])
    impixelinfo;
    pause(0.1)
end
