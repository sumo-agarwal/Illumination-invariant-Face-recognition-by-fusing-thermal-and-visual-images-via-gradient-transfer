I=im2double(imread('flir_20180822T011237.jpg'));
I1=rgb2gray(im2double(imread('flir_20180822T011237 (1).jpg')));
I1=imtranslate(I1,[0 -90]);
flag=zeros(1350,1080);
for j=1:1350
    for m=1:1080
        flag(j,m)=I1(j,m);
    end
end
imwrite(flag,'data1-v.jpg','jpg');
for j=1:1350
    for m=1:1080
        flag(j,m)=I(j,m);
    end
end
imwrite(flag,'data1-u.jpg','jpg');
