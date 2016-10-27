clc;
clear all;
close all;

im=imread('office_4.jpg');
im=rgb2gray(im);

d=negativefun(im);
% subplot(2,2,1)

% imshow(d,[]);

e=logarithm(im);
e1=e*255;
% subplot(3,2,2)
% imshow(e,[]);
f=inverse(im);
f1=f*(255/16);
% subplot(2,2,3)
% imshow(f,[]);
g=powertransfer(im);
g1=g*255;
% subplot(2,2,4)
% imshow(g,[]);
  plot(im,d,im,e1,im,f1,im,g1);title('Pixel wise transformation');xlabel('Original image'), ylabel('Pixelwise Transformed images');












































