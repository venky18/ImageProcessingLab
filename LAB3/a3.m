% bit plane slicing
clc;
clear all;
close all;
subplot(3,3,1)
a=imread('skull.tif');
a=double(a);
imshow(a,[]);title('Original Image');
[r,c]=size(a);

for i=1:r
    for j=1:c
        
        d=a(i,j);
        e0(i,j)=mod(d,2);
        d1=floor(d/2);
        e1(i,j)=mod(d1,2);
        d2=floor(d1/2);
        e2(i,j)=mod(d2,2);
        d3=floor(d2/2);
        e3(i,j)=mod(d3,2);
        d4=floor(d3/2);
        e4(i,j)=mod(d3,2);
        d5=floor(d4/2);
        e5(i,j)=mod(d5,2);
        d6=floor(d5/2);
        e6(i,j)=mod(d6,2);
        d7=floor(d6/2);
        e7(i,j)=mod(d7,2);
    end
end
subplot(3,3,2)
imshow(e0,[]);title('Least significant bit plane');
subplot(3,3,3)
imshow(e1,[]);title('');
subplot(3,3,4)
imshow(e2,[]);title('');
subplot(3,3,5)
imshow(e3,[]);title('');
subplot(3,3,6);
imshow(e4,[]);title('');
subplot(3,3,7)
imshow(e5,[]);title('');
subplot(3,3,8)
imshow(e6,[]);title('');
subplot(3,3,9)
imshow(e7,[]);title('');

for i=1:r
    for j=1:c
        e8(i,j)=( (128*e7(i,j))+ (64*e6(i,j)) + (32*e5(i,j)) +(16*e4(i,j))) ;
    end
end
%subplot(2,2,4)
%imshow(e8,[]);title('Reconstucted image');
