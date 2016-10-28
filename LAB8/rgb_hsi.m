clc;
clearvars;
close all;
A=imread('peppers.png');
%Represent the RGB image in [0 1] range
I=double(A)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
%Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
%To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));
%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);
%Normalize to the range [0 1]
H=H/360;
%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);
%Intensity
I=sum(I,3)./3;
%HSI
HSI=zeros(size(A));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
subplot(3,3,1);imhist(H);title('H of original image');
subplot(3,3,2);imhist(S);title('S of original image');
subplot(3,3,3);imhist(I);title('I of original image');
H_eq = histeq(H);
S_eq = histeq(S);
I_eq = histeq(I);

subplot(3,3,4);imhist(H_eq);title('H of equalised');
subplot(3,3,5);imhist(S_eq);title('S of equalised image');
subplot(3,3,6);imhist(I_eq);title('I of equalised image');
HSI_eq=zeros(size(A));
HSI_eq(:,:,1)=H_eq;
HSI_eq(:,:,2)=S_eq;
HSI_eq(:,:,3)=I_eq;
subplot(3,3,7);imshow(HSI,[]);title('original HSI image');
subplot(3,3,8);imshow(HSI_eq,[]);title('equalised HSI image');


