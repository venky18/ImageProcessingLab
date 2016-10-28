clc;
clear all;
close all;
image_ori = imread('coffee.tif');
%image_ori = rgb2gray(image_ori);
image_double = double(image_ori);

[row,col] = size(image_ori);
for i =1:row
    for j =1:col
        k=double(image_ori(i,j))/255;
        image_changed(i,j) = (10^-45)*exp((1+k));
    end
end
subplot(2,2,[1 3])   ;    
imshow(image_changed);
subplot(2,2,[2 4]);
imshow(image_ori);
%subplot(2,3,[3 6]);
%imshow(image_double);
figure;
plot(image_ori,image_changed);

% plot(image_ori,image_changed);