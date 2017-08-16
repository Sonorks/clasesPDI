clear all; close all; clc
a=videoinput('winvideo',1,'RGB24_640x480');
suma=[];
%preview(a);
%set('a',returnedcolorspace','rgb'); por si vienen en otro formato 
for i=1:10
    b=getsnapshot(a);
    pause(0.0001);
    c=getsnapshot(a);
    d = b-c; %e=imresize(d,3); pal tamaño
    r= sum(d(:)); suma =[suma,r];
    figure(1); imshow(d)
end
figure(2); plot(suma);
%sum(a) suma los valores del vector
%a(:) muestra como estan almacenados los datos
%find(a==7) busca en que posición está el dato 7 en a
%matlab no guarda por matrices sino por vectores
%[x,y] = find (a>7) lo muestra en posiciones matriciales