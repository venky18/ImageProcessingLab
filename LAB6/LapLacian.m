A=imread('cameraman.tif');
subplot(1,3,1);imshow(A);
I1=A;
I=zeros(size(A));
I2=zeros(size(A));

%Filter Masks
F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];
A=padarray(A,[1,1]);
A=double(A);

for i=1:size(A,1)-2
    for j=1:size(A,2)-2
        I(i,j)=sum(sum(F1.*A(i:i+2,j:j+2)));
    end
end

I=uint8(I);
subplot(1,3,2);imshow(I);title('Filtered Image');
%Sharpenend Image
B=I1-I;
subplot(1,3,3);imshow(B);title('Sharpened Image');