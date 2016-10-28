function [ g1 ] = Butterworth( a,d_0,n )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[r,c] = size(a);

%padcam = padarray(a,[floor(r/2) floor(c/2)],0,'both');
padcam = padarray(a,[r  c],0,'post');
a1 = im2double(padcam);
[r_pad,c_pad] = size(a1);
a1_p = a1;
for i =1:r_pad
    for j = 1:c_pad
        a1_p(i,j) = a1(i,j)*((-1)^(i+j));
    end
end
a1_fd = fft2(a1_p);
g1_fd = zeros(size(a1_fd));
D_0 = d_0;
h_fd = zeros(size(a1_fd));
for i_f =1:r_pad
   for j_f = 1:c_pad
     D = (((i_f-(r_pad/2))^2)+ ((j_f-(c_pad/2))^2))^0.5;
     
         h_fd(i_f,j_f)= 1/(1+(D_0/D)^(2*n));
     
        % h_fd(i_f,j_f)= 0;
    
      
     g1_fd(i_f,j_f) = a1_fd(i_f,j_f)*h_fd(i_f,j_f);
   end
end
g2 = uint8((ifft2(g1_fd))*255);
g1 = g2(1:r,1:c);


end

