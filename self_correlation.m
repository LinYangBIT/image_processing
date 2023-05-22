
%图像的自相关

close all; 
clear all;
clc;
I1=imread('img1.png','png');%输入图像1（参考图像）
I1=I1(:,:,1);
figure(1)%显示输入图像1
colormap(gray(255));
image(I1)
axis off
FI1=fft2(I1);
max1=max(FI1);
max2=max(max1);
scale=1.0/max2;
FI1=FI1.*scale;
I2=imread('img1.png','png');%输入图像2（待识别图像）
I2=I2(:,:,1);
figure(2)%显示输入图像2
colormap(gray(255));
image(I2)
axis off
FI2=fft2(I2);
max1=max(FI2);
max2=max(max1);
scale=1.0/max2;
FI2=FI2.*scale;
FPR=FI1.*conj(FI2);%计算相关性
PR=ifft2(FPR);
PR=fftshift(PR);
max1=max(PR);
max2=max(max1);
scale=1.0/max2;
PR=PR.*scale;
figure(3)%空间域相关显示
colormap(gray(255));
PR=abs(256*PR);
image(PR);
axis off

