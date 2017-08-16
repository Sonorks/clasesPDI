clear all; close all; clc
a=videoinput('winvideo',1,'MJPG_1280x720');
suma=[];
%set('a','returnedcolorspace','rgb');
for i=1:1000
    b=getsnapshot(a);
    pause(0.000001);
    c=getsnapshot(a);
    d = b - c;
    r = sum(d(:)); suma=[suma,r];
    figure(1); imshow(d)
end
figure(2); plot(suma);