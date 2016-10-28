clc;
clear all;
close all;
w = [1 2 1; 2 4 2; 1 2 1];
im_o = imread('cameraman.tif');
im_double = im2double(im_o);
im = padarray(im_double,[1,1]);
im_noise = imnoise(im, 'gaussian');
[m,n] = size(w);
[r,c] = size(im_o);
%weighted average
q = 5;
for i = 2:r
    for j = 2:c
          im_w_avg(i,j) = sum(sum(w.*im_noise(i-1:i+1,j-1:j+1)))/16;
          im_avg_f(i,j) =  sum(sum(im_noise(i-1:i+1,j-1:j+1)))/9;
          im_geom_mean(i,j) = prod(prod(im_noise(i-1:i+1,j-1:j+1)))^(1/9);
          im_harmonic(i,j) = 9/sum(sum(1./im_noise(i-1:i+1,j-1:j+1)));
          im_contra_har(i,j) = (sum(sum(im_noise(i-1:i+1,j-1:j+1))))^(q+1) / (sum(sum(im_noise(i-1:i+1,j-1:j+1))))^(q);
    end
end
subplot(2,4,1);
imshow(im);
subplot(2,4,2);
imshow(im_noise,[])
subplot(2,4,3);
imshow(im_w_avg,[]);
subplot(2,4,4);
imshow(im_avg_f,[]);
subplot(2,4,5);
imshow(im_geom_mean,[]);
subplot(2,4,6);
imshow(im_harmonic,[]);
subplot(2,4,7);
imshow(im_contra_har,[]);
