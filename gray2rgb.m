
im=imread('result1.jpg');
figure('name','灰度级-彩色变换法');
subplot(1,2,1);
imshow(im);
%将灰度值先转换为double类型便于后续处理
im=double(im);
[M,N]=size(im);
%初始化R,G,B,RGB
R=ones(M,N);
G=ones(M,N);
B=ones(M,N);
RGB=ones(M,N,3);
%灰度值范围
L=256;
for i=1:M
    for j=1:N
        if im(i,j)<=L/4
            R(i,j)=0;
            G(i,j)=4*im(i,j);
            B(i,j)=L;
        else
            if im(i,j)<=L/2
                R(i,j)=0;
                G(i,j)=L;
                B(i,j)=-4*im(i,j)+2*L;
            else
                if im(i,j)<=3*L/4
                    R(i,j)=4*im(i,j)-2*L;
                    G(i,j)=L;
                    B(i,j)=0;
                else
                    R(i,j)=L;
                    G(i,j)=-4*im(i,j)+4*L;
                    B(i,j)=0;
                end
            end
        end
    end
end
%合成伪彩色图像
for i=1:M
    for j=1:N
        RGB(i,j,1)=R(i,j);
        RGB(i,j,2)=G(i,j);
        RGB(i,j,3)=B(i,j);
    end
end
%把大于255的数全部转化为255，而小于255的部分则保持原样不变。
RGB=uint8(RGB);
figure;
imshow(RGB);