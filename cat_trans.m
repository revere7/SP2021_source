% ʵ�ֶ�ͼ���arnold Cat�任��imgΪԭʼͼ��a��bΪarnold�任������countΪ�任����

function img_transed = arnold_trans(img,a,b,count)

% ȡͼ���С
[M,N] = size(img);
img_transed = zeros(M,N);

% ����arnold�任��ʽ���б任
for loop = 1:count
    for x=1:M
        for y=1:N
            x1=mod((x-1)+a*(y-1),M)+1;
            y1=mod(b*(x-1)+(a*b+1)*(y-1),N)+1;
            img_transed(x1,y1)=img(x,y);
        end
    end
    img = img_transed;
end

% ��ʽת��
img_transed = uint8(img_transed);

% ����任��ͼ��
figure;
%imshow(img_transed);