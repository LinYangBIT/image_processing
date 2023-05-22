close all; 
clear all;
clc;
im=imread('result1.jpg','jpg');
im=im(:,:,1);
imshow(im);
imextrema(im);