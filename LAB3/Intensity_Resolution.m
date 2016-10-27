clc;
clear all;
close all;
i_orig = imread('skull_2.tif');
subplot(2,2,1);
imshow(i_orig);title('original image');

i_orig = double(i_orig);
[r,c] = size(i_orig);
intensity_0 =8;
intensity_1 =32;
intensity_2 =64;
for i=1:r
    for j =1:c
        i_transformed_0(i,j) = floor(i_orig(i,j)/intensity_0);
        i_transformed_1(i,j) = floor(i_orig(i,j)/intensity_1);
        i_transformed_2(i,j) = floor(i_orig(i,j)/intensity_2);
    end
end
subplot(2,2,2);
imshow(i_transformed_0,[]);title('intensity resolution decreased by 8');
subplot(2,2,3);
imshow(i_transformed_1,[]);title('intensity resolution decreased by 16');
subplot(2,2,4);
imshow(i_transformed_2,[]);title('intensity resolution decreased by 32');