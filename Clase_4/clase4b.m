%Lectura de texto por imagen - proyecciones
clear all; close all; clc
a = imread('texto.png');
b = rgb2gray(a); b(b<254)=0;
figure(1); imshow(b); impixelinfo; pause;
c= b'; figure(2); imshow(c); impixelinfo; %se traspone la matriz para proyectarla verticalmente
d= sum(c); figure(3); plot(d); %para ver entre que columnas esta el texto
figure(4); 
e = b(4:26,:);
f=sum(e);
figure(5); plot(f); 
g=e(:,5:67);
figure(6); imshow(g);
figure(7); imshow(a(4:26,5:67,:));