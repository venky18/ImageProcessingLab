% Intensity resolution
clc;
clear all;
close all;

k1=2;
k2=16;
k3=32;

a=imread('skull_2.tif');

a=double(a);
subplot(2,2,1)
imshow(a,[]);title('original Image');

[b,c]=size(a);

for i=1:b
    for j=1:c
        
        e1(i,j)=floor(a(i,j)/k1);
        e2(i,j)=floor(a(i,j)/k2);
        e3(i,j)=floor(a(i,j)/k3);
    end
end
subplot(2,2,2)
imshow(e1,[]);title('Intensity resolution decreased by factor 2');
subplot(2,2,3)
imshow(e2,[]);title('Intensity resolution decreased by factor 16');
subplot(2,2,4)
imshow(e3,[]);title('Intensity resolution decreased by factor 32');