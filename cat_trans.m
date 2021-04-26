% 实现对图像的arnold Cat变换，img为原始图像，a，b为arnold变换参数，count为变换次数

function img_transed = arnold_trans(img,a,b,count)

% 取图像大小
[M,N] = size(img);
img_transed = zeros(M,N);

% 根据arnold变换公式进行变换
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

% 格式转换
img_transed = uint8(img_transed);

% 输出变换后图像
figure;
%imshow(img_transed);