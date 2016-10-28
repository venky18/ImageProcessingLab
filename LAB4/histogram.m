clc; clear all; close all;
im_o = imread('office_1.jpg');% hawkes bay
im = double(rgb2gray(im_o));
% im = double(im);
[r,c] = size(im);
hist = zeros(1,256);
for i = 1:r
    for j = 1:c
        value = im(i,j);
        hist(value+1) = hist(value+1)+1;
    end
end
subplot(2,3,1);
imshow(im_o,[]);
title('original image')
subplot(2,3,2);
bar(hist);
title('histogram of image');
%%Pdf 
pdf =hist;
pdf = pdf./(r*c);
subplot(2,3,3);
bar(pdf);
title('PDF of image');
%%cdf
cdf = pdf;
for i =2:256
    cdf(i) = cdf(i)+cdf(i-1);
end
subplot(2,3,4);
bar(cdf);
title('CDF of image');
%%Equalisation

output=round(cdf*256);     
for i=1:r
    for j=1:c
        x(i,j)=output(im(i,j)+1);
    end
end
hist_norma = zeros(1,257);
[row,col] = size(x);
for i = 1:row
    for j = 1:col
        valuex = x(i,j);
%         ba = sprintf('%d ',x(i,j));
%         disp(ba)
        hist_norma(valuex+1) = hist_norma(valuex+1)+1;
    end
end
subplot(2,3,5);
bar(hist_norma);
title(' histogram of normalized image');
subplot(2,3,6);
imshow(x,[]);
title(' normalized image');



    