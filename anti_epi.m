clc;

imgPath = 'F:\Users\Revere\Desktop\OLͼƬ\EPIbianli\'; % ͼ���·��
imgDir = dir([imgPath '*.png']); % ��������png��ʽ�ļ�

%for i = 1:length(imgDir) % �����ṹ��Ϳ���һһ����ͼƬ��
  %img = imread([imgPath imgDir(i).name]); %��ȡÿ��ͼƬ
  
      for j=1:101
       % disp(j);
       for k1=3:length(imgDir)
            img=imread([imgPath imgDir(k1).name]);
            epi_img(k1,:)=img(j,:);
       end
         imshow(epi_img);
         imwrite(epi_img,['F:\Users\Revere\Desktop\OLͼƬ\test\',int2str(j),'.png']);
      end
    
 
%end

 