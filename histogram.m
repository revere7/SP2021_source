
clc;

I1=imread('orig.png');
I2=imread('finalenc.png');

[h,v,d]=correlation_calculation(I1,I2);

%ԭͼֱ��ͼ
figure;imhist(I1);title('The histogram of the plain image');

figure;imhist(I2);title('The histogram of the cipher image');