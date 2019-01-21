r=576;
c=768;
v=im2double(imread('bunker_r.bmp'));
u=im2double(imread('IR_bunker_g.bmp'));
flag=0.5*u+0.5*v;
%fun=@dusion1;
%options = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton','MaxIterations',1);
%[x,fval]= fminsearch(fun,flag);