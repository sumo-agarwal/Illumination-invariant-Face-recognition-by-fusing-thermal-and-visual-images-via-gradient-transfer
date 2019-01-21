I=im2double(imread('flir_20180820T142336 (1).jpg'));
i=rgb2gray(imresize(I,4/9));
i=imtranslate(i,[0 -30]);
figure
imshow(i);
U=im2double(imread('flir_20180820T142336.jpg'));
figure
imshow(U);
figure
imshowpair(i,U,'diff');
flag=zeros(610,480);
for j=1:610
    for m=1:480
        flag(j,m)=i(j,m);
    end
end
imwrite(flag,'test-v-3.jpg','jpg');
for j=1:610
    for m=1:480
        flag(j,m)=U(j,m);
    end
end
imwrite(flag,'test-U-3.jpg','jpg');