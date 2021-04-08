close all;clear all

f=imread('workshop.png','png');
if ndims(f) == 3
   f = rgb2gray(f);
end
%f=imresize(f,[256,256]);
f=round(f);
figure
imshow(uint8(f));
%title('原始图像');
tic
f=double(f);
[u,v]=size(f);
x=1:u;
y=1:v;
n(x,y)=abs(rand(u,v).*2.*pi);
b(x,y)=abs(rand(u,v).*2.*pi);
g=f.*exp(i.*n(x,y));% exp(i.*n(x,y))reduce peak signal
G=frft2d(g,[1.3,1.5]);
H=G.*exp(i.*b(x,y));
h=frft2d(H,[2.4,1.2]);
toc
figure
z=abs(h);
imshow(uint8(z));

%imwrite(uint8(h),'1.png');
%title('加密图像')  % 一个complex-value 矩阵
%f=getframe(gcf);
%--------------------------------------------------------------------------
% h(1:2000)=0;
x1=1.49:0.001:1.51; 
H1=frft2d(h,[-2.4,-1.2]);
G1=H1.*exp(-i.*b(x,y));
for m=1:length(x1);
    struct_defined(m).g1=frft2d(G1,[-1.3,-x1(m)]);
    struct_defined(m).f1=struct_defined(m).g1.*exp(-1i.*n(x,y));

%imshow(abs(struct_defined(1).f1),[]);title('解密图像')%  需要quantitative analysis， PSNR，relative error，corelation coefficient。
    struct_defined(m).f1=abs(struct_defined(m).f1);
    [struct_defined(m).PSNR,struct_defined(m).MSE] = Psnr1( f,struct_defined(m).f1 );
    [struct_defined(m).T]=similar(f,struct_defined(m).f1);
    psnr(m)=struct_defined(m).PSNR;
    mse(m)=struct_defined(m).MSE;
    similar1(m)=struct_defined(m).T;
end


figure 
imshow(abs(struct_defined(10).f1),[]);%title('解密图像')%  需要quantitative analysis， PSNR，relative error，corelation coefficient。
%imwrite(abs(struct_defined(10).f1),[],'decry.png');
figure
plot(x1,mse);
xlabel('Fractional Order');
ylabel('MSE');
f=getframe(gcf);
imwrite(f.cdata,'mse.png');
hold on;

figure
plot(x1,psnr);
xlabel('Fractional Order');
ylabel('PSNR');
f=getframe(gcf);
imwrite(f.cdata,'psnr.png');
hold on;
figure
plot(x1,similar1);
xlabel('Fractional Order');
ylabel('Corelation Coefficient');
f=getframe(gcf);
imwrite(f.cdata,'cc.png');
hold on;
%display(struct_defined(m).PSNR)
%display(struct_defined(m).MSE)

