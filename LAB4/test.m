clc;
clear all;
close all;
a=imread('test_pattern.tif');
figure;
imshow(a);
title('Original Image');
b=im2double(a);

[m,n]=size(a);
b=imnoise(b,'salt & pepper',0.02);
figure;
imshow(b);
title('Noisy Image');
L(1:m,1:n)=0;
for i=1:m-2
    for j=1:n-2
       
        L(i,j)=[b(i,j)+2*b(i,j+1)+b(i,j+2)+2*b(i+1,j)+4*b(i+1,j+1)+2*b(i+1,j+2)+b(i+2,j)+2*b(i+2,j+1)+b(i+2,j+2)]/16; %average
       
        K(i,j)=[0*b(i,j)+1*b(i,j+1)+0*b(i,j+2)+1*b(i+1,j)-4*b(i+1,j+1)+1*b(i+1,j+2)+0*b(i+2,j)+1*b(i+2,j+1)+0*b(i+2,j+2)]; %high pass
       
        array=[b(i,j),b(i,j+1),b(i,j+2),b(i+1,j),b(i+1,j+1),b(i+1,j+2),b(i+2,j),b(i+2,j+1),b(i+2,j+2)];
       
        d(i,j)=median(array);  %median
        q(i,j)=min(array);  %minimum
        w(i,j)=max(array);  %maximum
    end;
end;
W=[-1 -1 -1; -1 8.9 -1; -1 -1 -1]; %%Highboost mask
for i=1:m-2
    for j=1:n-2
        a1(i,j)=[W(1)*b(i,j)+W(2)*b(i,j+1)+W(3)*b(i,j+2)+W(4)*b(i+1,j)+W(5)*b(i+1,j+1)+W(6)*b(i+1,j+2)+W(7)*b(i+2,j)+W(8)*b(i+2,j+1)+W(9)*b(i+2,j+2)];
    end;
end;
        figure;
imshow(L);
title('average');
figure;
imshow(a1);
title('highboost');
figure;
imshow(d);
title('median');
figure;
imshow(K);
title('highpass');
figure;
imshow(q);
title('min');
figure;
imshow(w);
title('max');