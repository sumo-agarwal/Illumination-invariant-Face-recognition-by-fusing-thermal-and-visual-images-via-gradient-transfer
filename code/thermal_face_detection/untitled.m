%for h=28:227
h= 14;
s=int2str(h);
    s1=strcat(s,'.jpg');
    s2=strcat(s,'-detect.jpg');
     s3=strcat(s,'-v.jpg');
     s4=strcat(s,'-visual.jpg');
I1=im2double(imread(s1));
Iv=im2double(imread(s3));
I=I1(:,:,1);
med=medfilt2(I,[100 100]);
I=imadjust(I);
imwrite(I,'im1.jpg','jpg');
%figure;
%imshow(I);
%figure;
%imshow(med);
imwrite(med,'im2.jpg','jpg');
adj=imadjust(med);
%figure;
%imshow(adj);
imwrite(adj,'im3.jpg','jpg');
bin=imbinarize(adj,0.75);
%figure;
%imshow(bin);
imwrite(bin,'im4.jpg','jpg');
biggest = bwareafilt(bin, 1, 'largest');
%figure;
%imshow(biggest);
imwrite(biggest,'im5.jpg','jpg');
big=imfill(biggest,'holes');
row=zeros(640,1);
col=zeros(480,1);
for i=1:640
    for j=1:480
        
            row(i,1)=row(i,1)+big(i,j);
            col(j,1)=col(j,1)+big(i,j);
        
    end
end
for i=1:640-1
    if(row(i,1)~=0 && row(i+1,1)==0)
        max_row=i+10;
    end
    if(row(i,1)==0 && row(i+1,1)~=0)
        min_row=i-10;
    end
end
for i=1:480-1
    if(col(i,1)~=0 && col(i+1,1)==0)
        max_col=i+10;
    end
    if(col(i,1)==0 && col(i+1,1)~=0)
        min_col=i-10;
    end
end
if min_col<=0
    min_col=1;
end
if min_row<=0
    min_row=1;
end
if max_row>640
    max_row=640;
end
if max_col>480
    max_col=480;
end
newimg=zeros(max_row-min_row+1,max_col-min_col+1);
for i=min_row:max_row
    for j=min_col:max_col
        
            newimg(i-min_row+1,j-min_col+1)=I1(i,j,1);
        
    end
end
newimg2=zeros(max_row-min_row+1,max_col-min_col+1);
for i=min_row:max_row
    for j=min_col:max_col
        
            newimg2(i-min_row+1,j-min_col+1)=Iv(i,j,1);
        
    end
end

%figure
%imshow(newimg);
imwrite(newimg,s2,'jpg');
imwrite(newimg2,s4,'jpg');
%end