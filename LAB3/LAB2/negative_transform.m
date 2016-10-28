clc;
clear all;
close all;
a=imread('office_1.jpg');
b= imread('office_6.jpg');
L= 256;
% b=rgb2gray(a); 
% subplot(2,1,1)
% imshow(b);
d=(L-1)-a;
e =(L-1)-b;
%subplot(2,1,2)
% imshow(d);
% close all;
subplot(2,1,1)
imshow(d);
subplot(2,1,2)
imshow(e);
% plot(b,d);xlabel('Input Image'), ylabel('Negative Image');