clc;
clear all;
a=rgb2gray(imread('football.jpg')); 

subplot(3,2,1);
imshow (a)
[r1,c1]= size(a);

b=padarray(a,size(a)/2);
subplot(3,2,2);
imshow(b)
b=double(b);
[r,c]= size(b);

for i= 1:r
    for j= 1:c
        f(i,j)=((-1)^(i+j))*(b(i,j));
    end
end
d=fft2(f);
subplot(3,2,3);
imshow(f/255)
h=zeros(r,c);
e=zeros(r,c);
for  i= 1:r
    for j= 1:c
        e(i,j)=(((i-(r/2))^2+(j-(c/2))^2)^0.5);
     if e(i,j)<=30
         h(i,j)=1;
     else 
          h(i,j)=0;
     end
    end
end

subplot(3,2,4);
imshow(h,[])

g=h.*f;
subplot(3,2,5);
imshow(g)

k=ifft2(g);
for i=1:r
    for j=1:c
        k1(i,j)= ((real(k(i,j))).*((-1)^(i+j)));
    end
end
subplot(3,2,6);
imshow(k1)