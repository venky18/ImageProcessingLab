%clc;
clear all;
A = imread('pattern.tif');
subplot(2,3,1);imshow(A);
%Fourier Transform
A_pad = padarray(A,size(A)/2);
four_trans = fft2(A_pad);
subplot(2,3,2);imshow(four_trans);
[p,q] = size(four_trans);
for i=1:r
    for j=1:c
        Dwe(i,j) = (((i-p/2)^2+(i-p/2)^2)^0.5) ;
        if Dwe(i,j)<=20
            FilterResponse(i,j) =1;
        else
            FilterResponse(i,j) = 0;
        end
    end
end
