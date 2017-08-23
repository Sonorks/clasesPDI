clear all; close all; clc
a = imread('lena.jpg');
b = rgb2gray(a);
figure(1); subplot 211; imshow(b); %211 = 2 filas y 1 columna y 1 posicion
c=imhist(b); %imhist muestra el histograma como tal o si se guarda en variable se guardan los datos del histograma
subplot 212; imhist(b);
d=b; %copia de la imagen
d(d<150) = 0; %poenr en 0 todos los pixeles menores a 100
d(d>0)=255; %umbralizar y binarizar
%figure(2); imshow(d); impixelinfo;
%figure(3); imhist(d);
%----------------------------------------
%Ecualizacion  del histograma
e = histeq(b);
figure(4); subplot 211; imshow(e); %211 = 2 filas y 1 columna y 1 posicion
subplot 212; imhist(e);
%----------------------------------------
%sum(sum(a) == sum(a(:))
