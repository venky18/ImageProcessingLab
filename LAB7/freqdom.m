clc;
clear all;close all;
A=rgb2gray(imread('football.jpg')); 

subplot(2,3,1);imshow(A);
%Fourier Transform
[p,q] = size(A);
for i= 1:p
    for j= 1:q
        f(i,j)=((-1)^(i+j))*(A(i,j));
    end
end
four_trans = fft2(A);
A_pad = padarray(four_trans,(size(four_trans)/2));
subplot(2,3,2);imshow(A_pad);
[p,q] = size(A_pad);
% for i= 1:p
%     for j= 1:q
%         f(i,j)=((-1)^(i+j))*(A_pad(i,j));
%     end
% end
for i=1:p
    for j=1:q
        Dwe(i,j) = (((i-p/2)^2+(i-p/2)^2)^0.5) ;
        if Dwe(i,j)<=20
            FilterResponse(i,j) =1;
        else
            FilterResponse(i,j) = 0;
        end
    end
end
sex = FilterResponse.*four_trans;
subplot(2,3,3);imshow(sex);
inverse_Fourier = ifft(sex);
for i=1:p
    for j=1:q
        k1(i,j)= ((real(sex(i,j))).*((-1)^(i+j)));
    end
end
subplot(2,3,4);imshow(k1);