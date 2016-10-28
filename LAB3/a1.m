clc;
clear all;
close all;

% k1=input('enter scale factor');
k1=2;
k2=4;
k3=8;
k4=16;
a=imread('skull.tif');
subplot(2,2,1)
imshow(a,[]);title('Original Image');

[b,c]=size(a);
m=1;
for i=1:b
  n=1;  
    if(mod(i,k1)==0)
        for j=1:c
            if(mod(j,k1)==0)
               e1(m,n)=a(i,j);
               n=n+1;
            end
        end
        m=m+1;
    end
end

subplot(2,2,2)
imshow(e1,[]);


