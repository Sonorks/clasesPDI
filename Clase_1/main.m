clear ALL, close ALL, clc
%limpiar todo el ws
%con ; no se muestra en el command Window.
a=imread('rgb.jpg');
figure(1); imshow(a); impixelinfo;
r= a(:,:,1); %la capa roja es la 1 
g= a(:,:,2); %capa verde = 2
b= a(:,:,3); %capa azul = 3
%muestra intensidad de los colores
figure(2); subplot 221; imshow(a);
subplot 222; imshow(r);
subplot 223; imshow(g);
subplot 224; imshow(b); impixelinfo;
r1= a; g1= a; b1= a;
r1(:,:,2:3)=0; %anula las capas azul y verde (3 y 2)
g1(:,:,1:2:3)=0; %del 1 al 3 saltando de a 2 posiciones
b1(:,:,1:2)=0; 
figure(3); imshow([a,r1;g1,b1]);
%matriz de imagen; se muestra = que los subplot