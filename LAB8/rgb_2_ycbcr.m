clc;
clearvars;
close all;
A=imread('peppers.png');
%Represent the RGB image in [0 1] range
I=double(A)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
YCBCR=rgb2ycbcr(I);
Y = YCBCR(:,:,1);
Cb = YCBCR(:,:,2);
Cr = YCBCR(:,:,3);
subplot(3,3,1);imhist(Y);title('Y of original image');
subplot(3,3,2);imhist(Cb);title('Cb of original image');
subplot(3,3,3);imhist(Cr);title('Cr of original image');
Y_eq = histeq(Y);
Cb_eq = histeq(Cb);
Cr_eq = histeq(Cr);

subplot(3,3,4);imhist(Y_eq);title('Y of equalised');
subplot(3,3,5);imhist(Cb_eq);title('Cb of equalised image');
subplot(3,3,6);imhist(Cr_eq);title('Cr of equalised image');
YCBCR_eq=zeros(size(A));
YCBCR_eq(:,:,1)=Y_eq;
YCBCR_eq(:,:,2)=Cb_eq;
YCBCR_eq(:,:,3)=Cr_eq;
subplot(3,3,7);imshow(YCBCR);title('original YCBCR image');
subplot(3,3,8);imshow(YCBCR_eq);title('equalised YCBCR image');


