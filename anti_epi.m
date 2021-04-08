clc;

imgPath = 'F:\Users\Revere\Desktop\OL图片\EPIbianli\'; % 图像库路径
imgDir = dir([imgPath '*.png']); % 遍历所有png格式文件

%for i = 1:length(imgDir) % 遍历结构体就可以一一处理图片了
  %img = imread([imgPath imgDir(i).name]); %读取每张图片
  
      for j=1:101
       % disp(j);
       for k1=3:length(imgDir)
            img=imread([imgPath imgDir(k1).name]);
            epi_img(k1,:)=img(j,:);
       end
         imshow(epi_img);
         imwrite(epi_img,['F:\Users\Revere\Desktop\OL图片\test\',int2str(j),'.png']);
      end
    
 
%end

 