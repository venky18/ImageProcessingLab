clc;
clear all;
close all;
i_orig = imread('lena.tif');
i_gray = rgb2gray(i_orig);
%i_gray = double(i_gray);
[r,c] = size(i_gray);
difference_0 =4;
difference_1 =8;
difference_2 =16;
m=1;
for i=1:r
  n=1;  
    if(mod(i,difference_0)==0)
        for j=1:c
            if(mod(j,difference_0)==0)
               i_transformed_0(m,n)=i_gray(i,j);
               n=n+1;
            end
        end
        m=m+1;
    end
end
m=1;
for i=1:r
  n=1;  
    if(mod(i,difference_1)==0)
        for j=1:c
            if(mod(j,difference_1)==0)
               i_transformed_1(m,n)=i_gray(i,j);
               n=n+1;
            end
        end
        m=m+1;
    end
end
m=1;
for i=1:r
  n=1;  
    if(mod(i,difference_2)==0)
        for j=1:c
            if(mod(j,difference_2)==0)
               i_transformed_2(m,n)=i_gray(i,j);
               n=n+1;
            end
        end
        m=m+1;
    end
end



subplot(2,2,1);
imshow(i_gray,[]);title('original image');
subplot(2,2,2);
imshow(i_transformed_0,[]);title('Spatial resolution decreased by facotor 4');
subplot(2,2,3);
imshow(i_transformed_1,[]);title('Spatial resolution decreased by facotor 8');
subplot(2,2,4);
imshow(i_transformed_2,[]);title('Spatial resolution decreased by facotor 16');
