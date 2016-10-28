function c=negativefun(a)
[row,col]=size(a);

for i=1:row
    for j=1:col
        
        c(i,j)=255-a(i,j);
    end
end