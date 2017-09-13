%--------------------------------------------------------------------------
%------- CÓDIGO Incluir Linea en una imagen entre dos punto ---------------
%------- Por: David Fernández  --------------------------------------------
%------- mayo de 2017 -----------------------------------------------------
%-------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializo el sistema -----------------------------------------------
%--------------------------------------------------------------------------

clear all;      % Inicializa todas las variables
close all;      % Cierra todas las ventanas, archivos y procesos abiertos
clc;            % Limpia

%--------------------------------------------------------------------------
%--2. imagen de la curva  -------------------------------------------------
%--------------------------------------------------------------------------

%-- Trabajamos en una sola capa grises ------------------------------------
%a=imread('curva.bmp');
a=imread('color_1_area_9082.tif');
a=a(:,:,1:3);
b=rgb2gray(a);
figure(1);
imshow(b);
impixelinfo

%-- Sacamos solo el perímetro   ------------------------------------------

%--------------------------------
level = graythresh(b);
c = im2bw(b, level);
c = imclose(c,strel('disk',3));
figure(2);
imshow(c);
impixelinfo
%--------------------------------

%--------------------------------
ima=c;
skel= bwmorph(ima,'skel',Inf);
figure(3);
imshow(skel);
title('bwmorph(ima,"skel",Inf)')
%--------------------------------

%--------------------------------
B = bwmorph(skel, 'branchpoints');
figure(4);
imshow(B);
title('bwmorph(skel, "branchpoints")')
%--------------------------------

%--------------------------------
E = bwmorph(skel, 'endpoints');
figure(5);
imshow(E);
title('bwmorph(skel, "endpoints")')
%--------------------------------

%--------------------------------
[y,x] = find(E);
B_loc = find(B);
Dmask = false(size(skel));
for k = 1:numel(x)
    D = bwdistgeodesic(skel,x(k),y(k));
    distanceToBranchPt = min(D(B_loc));
    Dmask(D < distanceToBranchPt) =true;
end
skelD = skel - Dmask;
skelD = im2bw(skelD, 0.5);

figure(6);
imshow(skelD);
title('Esqueletizado sin ramas')
%--------------------------------


%--------------------------------
d=skelD;
d=bwmorph(d,'endpoints');
figure(7);
imshow(d);
title('Solo los dos extremos')
%--------------------------------


%-- se saca el inventario de todos los puntos resultado -------------------


ind=find(d==true);

%-- Se trazan líneas para todos los casos -----------------------------
%-- tomado de https://www.quora.com/
%------How-do-I-connect-2-white-dots-from-an-image-with-a-minimum-distance
A=d;
B=false(size(A));
[x,y]=ind2sub(size(A),find(A));
nPoints=length(x);
for i=1:nPoints-1
    p(1,:)=[x(i), y(i)];
    for j=i+1:nPoints
        p(2,:)=[x(j), y(j)];
        nPixels=max(abs(p(1,:)-p(2,:)))+1;
        X=linspace(p(1,2), p(2,2), nPixels);
        f=(p(1,1)-p(2,1))/(p(1,2)-p(2,2));
        if isinf(f)
            Y=linspace(p(1,1),p(2,1),nPixels);
        else
            f(2)=-det(p)/(p(1,2) - p(2,2));
            Y=(f(1)*X+f(2));
        end;
        B(sub2ind(size(A),round(Y),round(X)))=true;
    end
end
figure(8);
imshow(B)
title('Línea que une los extremos')
%--------------------------------

%--------------------------------
c(B==true)=255;
c=uint8(c)*255;
figure(9);
imshow(c);
title('Curva cerrada')
%--------------------------------


%--------------------------------
d=c; d=imfill(d);
d(d>0)=1;area=sum(d(:));
figure(10);
imshow(d*255)
title(['Area en pixeles = ',num2str(area)])
%--------------------------------



