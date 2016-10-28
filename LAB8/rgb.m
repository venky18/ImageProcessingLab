clc;clearvars;close all;
A=imread('peppers.png');
%Represent the RGB image in [0 1] range
I=double(A)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
subplot(3,3,1);imhist(R);title('R of original image');
subplot(3,3,2);imhist(G);title('G of original image');
subplot(3,3,3);imhist(B);title('B of original image');
R_eq = histeq(R);
G_eq = histeq(G);
B_eq = histeq(B);
subplot(3,3,4);imhist(R_eq);title('R of equalised');
subplot(3,3,5);imhist(G_eq);title('G of equalised image');
subplot(3,3,6);imhist(B_eq);title('B of equalised image');
I_eq=zeros(size(A));
I_eq(:,:,1)=R_eq;
I_eq(:,:,2)=G_eq;
I_eq(:,:,3)=B_eq;
% I_eq = im2uint8(I_eq)*255; 
subplot(3,3,7);imshow(A,[]);title('RGB original image');
subplot(3,3,8);imshow(I_eq,[]);title('RGB equalised image');
% I_eq(:,:,1)=R_eq;
% I_eq(:,:,2)=G_eq;
% I_eq(:,:,3)=B_eq;

