imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = (im2double(imread(currentfilename)));
   s=int2str(ii);
   s1=strcat(s,'.jpg');
   imwrite(currentimage,s1,'jpg');

end


