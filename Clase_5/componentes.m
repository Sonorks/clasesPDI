function [a1,a2,a3,a4,a5,a6,s,b,y] = componentes(a)
%COMPONENTES Summary of this function goes here
%   Detailed explanation goes here
a1= chori(a);
a2= rgb2hsv(a); a2=normaliza(a2);s=a2(:,:,2); a2=chori(a2);
cform=makecform('srgb2lab');
a3=applycform(a,cform);
a3=normaliza(a3);b=a3(:,:,3); a3=chori(a3);
cform=makecform('srgb2cmyk');
a4=applycform(a,cform); a4=normaliza(a4); k=a4(:,:,4); a4=a4(:,:,1:3); 
y=a4(:,:,3); a4=chori(a4);
a5=[k,k,k];
a6=a5*0;
end

