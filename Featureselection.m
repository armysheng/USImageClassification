% %% Build Feature Matrix from image dataset
% clc
% for num=1:20
%      s = sprintf('C:\\Users\\Eric Sheng\\BaiduYunPersonal\\TextureDataSet\\unbricks\\D%d.gif', num);
%      I = imread(s); 
%      GLCMFeatures                                           %extract 22 features  from GLCM in each 10 distance
%      GLRLFeatures                                           %extract 11 features from GLRL matrix in each 4 direction
%      featureMatrix(num+14,:)=[GLCMFM,GLRLFM];               %merge 2 feature matrixs
%      pause(1);
% end

%% Feature Matrix preprocess for feature selection
[m,n]=size(featureMatrix);
A= featureMatrix;
for i=1:n
    A(:,i)=A(:,i)/norm(A(:,i));
end

%% Feature selection using FEAST toolbox
labels=[ones(14,1);2*ones(20,1)];
selectedIndices = feast('mrmr',5,A,labels)





