clc;
I1=imread('F:\Users\Revere\Desktop\OLͼƬ\cipher.png');
I2=imread('F:\Users\Revere\Desktop\OLͼƬ\2.png');
a=0.7;
b=1-a;
c=0.05;
enc = I1.*a +I2.*b+c;
imshow(enc);
imwrite(enc,'finalenc.png');