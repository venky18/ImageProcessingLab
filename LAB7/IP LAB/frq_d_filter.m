clc;
clear all;
close all;
a= imread('cameraman.tif');
al_25 = lowpass_fd(a,35);
al_100 = lowpass_fd(a,100);
ah_30 = highpass_fd(a,35);
ah_100 = highpass_fd(a,100);
ab_30 = Butterworth(a,35,3);
ab_100 = Butterworth(a,100,2);
ag_30 = Gaussian_fd(a,35);
ag_100 =Gaussian_fd(a,100);

figure
subplot(2,2,1)
imshow(al_25);
title('lowpass with cutoff 35');
subplot(2,2,2)
imshow(al_100);
title('lowpass with cutoff 100');
subplot(2,2,3)
imshow(ah_30);
title('Highpass with cutoff 35');
subplot(2,2,4)
imshow(ah_100);
title('Highpass with cutoff 100');

figure
subplot(2,2,1)
imshow(ab_30);
title('Butterworth with cutoff 35');
subplot(2,2,2)
imshow(ab_100);
title('Butterworth with cutoff 100');
subplot(2,2,3)
imshow(ag_30);
title('Gaussian with cutoff 35');
subplot(2,2,4)
imshow(ag_100);
title('Gaussian with cutoff 100');

[abp_30,hf] = bandpass_fd(a,35,10,3);
figure
subplot(2,1,1)
imshow(hf)
title('Filter response');
subplot(2,1,2)
imshow(abp_30)
title('Bandpass output');