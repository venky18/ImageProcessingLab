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
        im_median(i,j) = median(median(im_noise(i-1:i+1,j-1:j+1)));
        im_max(i,j) =  max(max(im_noise(i-1:i+1,j-1:j+1)));
        im_min(i,j) = min(min(im_noise(i-1:i+1,j-1:j+1)));
        im_mid_point(i,j) = 0.5*( max(max(im_noise(i-1:i+1,j-1:j+1))) + min(min(im_noise(i-1:i+1,j-1:j+1))));
        %im_aplha_trimmed(i,j) = (1/(r*c))*sum(sum(im_noise()));
    end
end
d =2;
im_aplha_trimmed = imfilter(im_noise, ones(m, n), 'symmetric');
for k = 1:d/2
    im_aplha_trimmed = imsubtract(im_aplha_trimmed, ordfilt2(im_noise, k, ones(m, n), 'symmetric'));
end
for k = (m*n - (d/2) + 1):m*n
    im_aplha_trimmed = imsubtract(im_aplha_trimmed, ordfilt2(im_noise, k, ones(m, n), 'symmetric'));
end

im_aplha_trimmed = im_aplha_trimmed / (m*n - d);
subplot(2,4,1);imshow(im);title('original image');
subplot(2,4,2);imshow(im_noise,[]);title('image with gaussian noise');
subplot(2,4,3);imshow(im_median,[]);title('median filter filter');
subplot(2,4,4);imshow(im_max,[]);title('max filter filter');
subplot(2,4,5);imshow(im_min,[]);title('min filter filter');
subplot(2,4,6);imshow(im_mid_point,[]);title('midpoint filter filter');
subplot(2,4,7);imshow(im_aplha_trimmed,[]);title('alpha-trimmed filter');

