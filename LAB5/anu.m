clc;
clear all;
close all;
im_o = imread('cameraman.tif');
im_double = im2double(im_o);
im = padarray(im_double,[1,1]);
im_noise = imnoise(im, 'gaussian');
%[m,n] = size(w);
[r,c] = size(im_o);
for i = 2:r
    for j = 2:c
        mp(i,j) = mean(im_noise(1+d/2:end-d/2));
    end
end
% mps = sort(mp);
% sw =0;
% for i = 2:r
%     for j = 2:c
%        for rdh =3:7
%             sw = sw + mps(rdh);
%         end 
%         xc(i,j) = sw/5;
%         
%     end
% end
imshow(xc,[])