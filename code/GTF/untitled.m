I1=im2double(imread('flir_20180809T094506.jpg'));
I=I1(:,:,1);
med=medfilt2(I,[100 100]);
I=imadjust(I);
figure;
imshow(I);
figure;
imshow(med);
adj=imadjust(med);
figure;
imshow(adj);
bin=imbinarize(adj,0.75);
figure;
imshow(bin);
biggest = bwareafilt(bin, 1, 'largest');
figure;
imshow(biggest);
big=imfill(biggest,'holes');
row=zeros(1440,1);
col=zeros(1080,1);
for i=1:1440
    for j=1:1080
        
            row(i,1)=row(i,1)+big(i,j);
            col(j,1)=col(j,1)+big(i,j);
        
    end
end
for i=1:1440-1
    if(row(i,1)~=0 && row(i+1,1)==0)
        max_row=i+10;
    end
    if(row(i,1)==0 && row(i+1,1)~=0)
        min_row=i-10;
    end
end
for i=1:1080-1
    if(col(i,1)~=0 && col(i+1,1)==0)
        max_col=i+10;
    end
    if(col(i,1)==0 && col(i+1,1)~=0)
        min_col=i-10;
    end
end
newimg=zeros(1440,1080);
for i=min_row:max_row
    for j=min_col:max_col
        
            newimg(i,j)=I1(i,j,1);
        
    end
end

figure
imshow(newimg);
imwrite(newimg,'flir-1-detect.jpg','jpg');