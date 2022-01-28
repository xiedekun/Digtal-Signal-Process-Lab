cd 'C:\MisterDK\Queen Mary University of London\Courses\Digital Signal Processing\LAB ASSESSMENTS\LAB1\images';
imagedata = imread('knit.jpg');
%查看图片信息
imfinfo('knit.jpg');
%创建和图片大小相同的窗口
figure('Position', [100 120 size(imagedata, 2) size(imagedata, 1)]);
imagesc(imagedata);
set(gca, 'Position', [0 0 1 1]);
colormap('gray');