%%%%%%------------------ͼ��ԭ֮�ռ��˲�---------------------------------
clc;
clear;
%����ͼ�񣬲�ת��Ϊdouble��
I=imread('img1gray.jpg');
I_D=im2double(I);
[MM,NN]=size(I_D);
 
%%%%%----------------------2��˳��ͳ���˲���-------------------------------
%%======================= 2.2 ���ֵ����Сֵ�˲���=========================
%���ֵ�˲��ʺϴ�����С�������������ͼ��
%��Сֵ�˲����ʺϴ�����С��Ρ�������ͼ��
%�����Ӵ��ڵĳߴ�
m=3;
n=3;
%ȷ��Ҫ��չ��������
len_m=floor(m/2);
len_n=floor(n/2);
%��ԭʼͼ�������չ����������˾�����չ���Խ���ͼ���Ե����
I_D_pad=padarray(I_D,[len_m,len_n],'symmetric');
%�����չ���ͼ��ߴ�
[M,N]=size(I_D_pad);
J_Max=zeros(MM,NN);
%J_Min=zeros(MM,NN);
%�������Ӵ��ڵ����/��Сֵ
for i=1+len_m:M-len_m
    for j=1+len_n:N-len_n
        %����չͼ����ȡ����ͼ��
        Block=I_D_pad(i-len_m:i+len_m,j-len_n:j+len_n);
        %���ֵ�˲�        
   %      J_Max(i-len_m,j-len_n)=max(max(Block));
        %��Сֵ�˲�        
         J_Min(i-len_m,j-len_n)=min(min(Block));        
    end
end
imshow(J_Max);
title('���ֵ�˲���');

