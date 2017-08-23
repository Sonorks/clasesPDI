
clear all; close all; clc
a=imread('nal.jpg');
b=imread('kratos.jpg');
% a1= rgb2gray(a);
% b1= rgb2gray(b);
[x1,y1,z1]=size(a); %saca filas, columnas y capas de la imagen
[x2,y2,z2]=size(b);
% b2= imresize(b1,[x1,y1]);
% c= (a1/2)+(b2/2); % sumar medios es diferente que sumar y dividir por 2
% figure(1); imshow([a1,b2,c]); impixelinfo
% imwrite(c,'photoshopIsDead.jpg');
%con control + R comenta codigo
%A color
b3=imresize(b,[x1,y1]);
% Prepare the new file --> video.
vidObj = VideoWriter('camtasiaIsDead.avi');
open(vidObj);
for i=0:0.005:1  %disminuir la i aumenta los FPS
    c=a*i + b3*(1-i);
    figure(2); imshow(c);
    currFrame = getframe;
%     for ii=1:10
%         writeVideo(vidObj,currFrame);
%     end
    writeVideo(vidObj,currFrame);
    pause(0.001);
end
for i=1:-0.005:0
    c=a*i + b3*(1-i);
    figure(2); imshow(c); 
    currFrame = getframe;
%     for ii=1:10
%         writeVideo(vidObj,currFrame);
%     end
    writeVideo(vidObj,currFrame);
    pause(0.001);
end
close(vidObj);