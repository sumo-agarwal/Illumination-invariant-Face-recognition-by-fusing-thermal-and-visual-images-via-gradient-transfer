
%{
imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = (im2double(imread(currentfilename)));
   s=int2str(ii);
   s1=strcat(s,'.jpg');
   imwrite(currentimage,s1,'jpg');

end
%}

for ii=6:227
   s=int2str(ii);
   s1=strcat(s,'.jpg');
   s2=strcat(s,'-v.jpg');
   currentimage = (im2double(imread(s1)));
   imwrite(currentimage,s2,'jpg');

end
