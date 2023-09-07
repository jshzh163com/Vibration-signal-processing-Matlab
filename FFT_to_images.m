clear; clc; close all;

%%
img = imread('cat.png');

figure(10);
subplot(2, 2, 1); imshow(img);
title('Original');

f = rgb2gray(img);    %   im2double
f = im2double(img);   

F = fft2(f);  
F1 = log(abs(F) + 1);

subplot(2, 2, 2); imshow(F1, []);
title('FT');

Fs = fftshift(F);
S = log(abs(Fs) + 1);

subplot(2, 2, 3); imshow(S, []);
title('FT After shift');

fr = real(ifft2(ifftshift(Fs)));
ret = im2uint8(mat2gray(fr));

subplot(2, 2, 4); imshow(ret);
title('Inverse');





