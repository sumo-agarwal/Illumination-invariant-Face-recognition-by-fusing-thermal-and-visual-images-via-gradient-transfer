function f = dusion1(x)
v=im2double(imread('bunker_r.bmp'));
u=im2double(imread('IR_bunker_g.bmp'));
r=576;
c=768;
y=0;
%[Gx,Gy] = imgradientxy(v);
%[Gx,Gy] = imgradientxy(v);
%[Gmag, Gdir] = imgradient(v);
%figure;
%imshow(Gmag);

for i=1:r
    for j=1:c
        
        y=y+abs(x(r,c)-u(i,j));
    end
end
z=x-v;
[Gmag, Gdir] = imgradient(z);
for i=1:r
    for j=1:c
        y=y+Gmag(i,j);
    end
end
f=y;
end



%Gx2=Gx.*Gx;
%Gy2=Gy.*Gy;
%G2=Gx2+Gy2;
%G=sqrt(G2);