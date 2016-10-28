function g=powertransfer(im)
[r,c]=size(im);
d=double(im)/255;
for i=1:r
   for j=1:c
  g(i,j)=d(i,j)^0.5; 
   end
end