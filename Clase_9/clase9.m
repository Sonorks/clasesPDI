clear all, close all, clc
a=imread('casa.bmp');
for i=1:10:360
    a=imrotate(a,i,'bicubic','crop'); %%bilinear, bicubic
    figure(1); imshow(a); %calcular analiticamente el error en cualquier angulo cualquier tiempo
    pause(0.1)
end