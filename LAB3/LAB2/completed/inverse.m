function h = inverse(b)
[r,c]=size(b);
for i=1:r
    for j=1:c
        k=double(b(i,j))/255;
h(i,j)=exp(1+k);
    end 
end