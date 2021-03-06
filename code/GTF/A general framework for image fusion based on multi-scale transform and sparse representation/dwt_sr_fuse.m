function F=dwt_sr_fuse(I1,I2,zt,D,overlap,epsilon)
%    DWT-SR
%    Input:
%    I1 - input image A
%    I2 - input image B
%    zt - maximum decomposition level
%    D  - Dictionary for sparse representation
%    overlap - the overlapped pixels between two neighbor patches
%    epsilon - sparse reconstuction error
%    Output:
%    F  - fused image   
%
%    The code is edited by Yu Liu, 01-09-2014.

%-------------------------------------------------------------------------%
%                                DWT
%-------------------------------------------------------------------------%
I1=double(I1);
I2=double(I2);
tempA=I1;
tempB=I2;
                
X=cell(zt,4);                                                                                       
Y=cell(zt,4);                                               
Z=cell(zt,4);  
for i=1:zt
    [X{i,1},X{i,2},X{i,3},X{i,4}]=dwt2(tempA,'db1','mode','per'); 
    tempA=X{i,1};
    [Y{i,1},Y{i,2},Y{i,3},Y{i,4}]=dwt2(tempB,'db1','mode','per'); 
    tempB=Y{i,1};
end

%-------------------------------------------------------------------------%
%                               low-pass fusion
%-------------------------------------------------------------------------%
Z{zt,1}=sparse_fusion(X{zt,1},Y{zt,1},D,overlap,epsilon);


%-------------------------------------------------------------------------%
%                               high-pass fusion
%-------------------------------------------------------------------------%             
for i=zt:-1:1                           
    for j=2:4
        Z{i,j}=selc(X{i,j},Y{i,j},3);    
    end
end

%-------------------------------------------------------------------------%
%                               IDWT
%-------------------------------------------------------------------------%
for i=zt:-1:1
    if i>1
        Z{i-1,1}=idwt2(Z{i,1},Z{i,2},Z{i,3},Z{i,4},'db1','mode','per');
    else
        F=idwt2(Z{i,1},Z{i,2},Z{i,3},Z{i,4},'db1','mode','per');
    end
end
