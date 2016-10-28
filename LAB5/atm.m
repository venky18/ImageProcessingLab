%alpha-trimmed filter
im_o = imread('cameraman.tif');
im_double = im2double(im_o);
im = padarray(im_double,[1,1]);
im_noise = imnoise(im, 'gaussian');
m = 4 ;
n =4;
[r,c] = size(im_o);
d = 2;
if (d <= 0) || (d/2 ~=round(d/2))
error('d must be a positive, even integer.')
end
f = imfilter(im_noise, ones(m, n), 'symmetric');
for k = 1:d/2
    f = imsubtract(f, ordfilt2(im_noise, k, ones(m, n), 'symmetric'));
end
for k = (m*n - (d/2) + 1):m*n
    f = imsubtract(f, ordfilt2(im_noise, k, ones(m, n), 'symmetric'));
end

f = f / (m*n - d);
subplot(2,1,1);imshow(f,[]),title('alpha-trimmed filtered image');
subplot(2,1,2);imshow(im_noise);