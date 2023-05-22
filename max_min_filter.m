%%%%%%------------------图像复原之空间滤波---------------------------------
clc;
clear;
%读入图像，并转换为double型
I=imread('img1gray.jpg');
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------2、顺序统计滤波器-------------------------------
%%======================= 2.2 最大值或最小值滤波器=========================
%最大值滤波适合处理带有“胡椒噪声”的图像
%最小值滤波器适合处理带有“盐”噪声的图像
%定义子窗口的尺寸
m=3;
n=3;
%确定要扩展的行列数
len_m=floor(m/2);
len_n=floor(n/2);
%将原始图像进行扩展，这里采用了镜像扩展，以进行图像边缘计算
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%获得扩展后的图像尺寸
[M,N]=size(I_D_pad);
J_Max=zeros(MM,NN);
%J_Min=zeros(MM,NN);
%逐点计算子窗口的最大/最小值
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %从扩展图像中取出子图像
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %最大值滤波        
   %      J_Max(i-len_m,j-len_n)=max(max(Block));
        %最小值滤波        
         J_Min(i-len_m,j-len_n)=min(min(Block));        
    end
end
imshow(J_Max);
title('最大值滤波器');

