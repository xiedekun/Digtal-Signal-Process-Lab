img = imread('C:\MisterDK\Queen Mary University of London\Courses\Digital Signal Processing\LAB ASSESSMENTS\LAB1\images\bridge.gif');
img_movavg = mov_avg_multi_dim(img, 5);
imagesc(img_movavg);
colormap('gray');
