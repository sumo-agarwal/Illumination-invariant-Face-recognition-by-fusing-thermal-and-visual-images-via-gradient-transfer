v=im2double(imread('data1-v.jpg'));
u=im2double(imread('data1-u.jpg'));
r=1350;
c=1080;
y=0;
x=im2double(imread('data-1-30.jpg'));
%[Gx,Gy] = imgradientxy(v);
%[Gx,Gy] = imgradientxy(v);
%[Gmag, Gdir] = imgradient(v);
%figure;
%imshow(Gmag);

for i=1:r
    for j=1:c
        y
        y=y+abs(x(i,j)-u(i,j));
    end
end

z=x-v;
[Gmag, Gdir] = imgradient(z);
for i=1:r
    for j=1:c
        y=y+15*Gmag(i,j);
    end
end
y_15=y;




%Gx2=Gx.*Gx;
%Gy2=Gy.*Gy;
%G2=Gx2+Gy2;
%G=sqrt(G2);