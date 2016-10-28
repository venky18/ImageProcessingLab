clc;
clear all;
close all;
a=imread('football.jpg');
subplot(3,2,1)
imshow(a,[]);
a=double(a);
l1=length(a);
l=length(a)/255;

red=a(:,:,1);
green=a(:,:,2);
blue=a(:,:,3);
R=red;
G=green;
B=blue;
[r,c]=size(green);

v=zeros(1,256);
p=0:255;
for k=1:256
    b=0;
for i=1:r
    for j=1:c
         if green(i,j)==(k-1);              
        b=b+1;  
    end
    v(1,k)=b; 
end
end
end
 subplot(3,2,2);
 stem(v)
 xlabel('intensity level');
 ylabel('no.of occurance');
 title('histogram');
 for i=1:256
     p(i)=v(i)/(r*c);
 end
     subplot(3,2,3);
     stem(p);
     title('normalised pdf');
     
     for i=1:256
         s(i)=0;
         if i<2
             s(i)=p(i);
         else
             s(i)=s(i-1)+p(i);
         end
     end
     subplot(3,2,4);
     stem(s)
     title('cdf');
     
     x=zeros(r,c);
     for i=1:r
         for j=1:c
             for k=0:255
                 if green(i,j)==k;
                     x(i,j)= s(1,(k+1));
                 end
             end
         end
     end
     subplot(3,2,5);
     imshow(x);
     title('green component')
     
      [r1,c1]=size(blue);
%     % B=double(B);
%     % G=double(G);
      for i=1:r1
          for j=1:c1
              theta(i,j)=acos(((0.5).*((R(i,j)-G(i,j))+(R(i,j)-B(i,j))))/((R(i,j)-G(i,j)).^2+(R(i,j)-B(i,j))*(G(i,j)-B(i,j))).^0.5);
             if B(i,j)<=G(i,j)
                h(i,j)=theta(i,j);
             else
                 h(i,j)=360-theta(i,j);
                end
          end
      end
      
      
     subplot(3,2,6);
     imshow(h,[]);