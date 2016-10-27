clc;
clear all;
close all;
image_ori = imread('office_1.jpg');
image_double = double(image_ori)/255;

[row,col] = size(image_ori);
for i =1:row
    for j =1:col
        image_changed(i,j) = log10((1+image_double(i,j)));
    end
end
subplot(2,2,[1 3])   ;    
imshow(image_changed);
subplot(2,2,[2 4]);
imshow(image_ori);
% plot(image_ori,image_changed);