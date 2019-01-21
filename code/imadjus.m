I=rgb2gray(im2double(imread('flir_20180820T142336 (1).jpg')));
adj=imadjust(I);
figure
imshow(adj);
figure
imshow(I);