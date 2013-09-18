clc;
clear;
I = imread('breast_ROI.png');
I = rgb2gray(I);
imhist(I);

%% 0°方向1~10距离灰度共生矩阵 

%  for i=1:10
%      glcm0(:,:,i)= graycomatrix(I,'NumLevels',256,'Offset',[0 i],'Symmetric', false);
%  end
%  %归一化处理
%  glcm0=glcm0/sum(glcm0(:));
%  %% 45°方向1~10距离灰度共生矩阵
%  for i=1:10
%      glcm45(:,:,i)= graycomatrix(I,'NumLevels',256,'Offset',[-i,i],'Symmetric',false);
%  end
%   %归一化处理
%  glcm45=glcm45/sum(glcm45(:));
%   %% 90°方向1~10距离灰度共生矩阵
%  for i=1:10
%      glcm90(:,:,i)= graycomatrix(I,'NumLevels',256,'Offset',[-i,0],'Symmetric',false);
%  end
%  %归一化处理
%  glcm90=glcm90/sum(glcm90(:)); 
%   %% 135°方向1~10距离灰度共生矩阵
%  for i=1:10
%      glcm135(:,:,i)= graycomatrix(I,'NumLevels',256,'Offset',[-i,-i],'Symmetric',false);
%  end
%   %归一化处理
%  glcm135=glcm135/sum(glcm135(:));

 %% generating glcms  4 directions and 10 pixs distances
 for j=1:4
     for i= 1:10
         offset=[0,i;-i,i;-i,0;-i,-i];
         glcm(:,:,i,j)=graycomatrix(I,'NumLevels',256,'Offset',offset(j,:),'Symmetric',false);
     end
 end
 
  %%  计算（计算22个特征）
 for j= 1:4
     for i = 1:10
         stats(i,j)=glcm_features1(glcm(:,:,i,j),0);
%          stats_default(i,j) = graycoprops(glcm(:,:,i,j),'all');%old version
     end
 end
 
%% default features 
%  for j=1:4   
%     for i=1:10;
%         F_contrast(i,j)=stats_default(i,j).Contrast;
%         F_Correlation1(i,j)=stats_default(i,j).Correlation1;
% %         F_Correlation2(i,j)=stats_default(i,j).Correlation2;
%         F_Energy(i,j)=stats_default(i,j).Energy;
%         F_Homogeneity(i,j)=stats_default(i,j).Homogeneity;
%     end
%  end
%  
%  s
%      F_contrast= sum(F_contrast,2)/4;

%% 22features extracted from glcms
% Features computed 
% Autocorrelation: [2]                      (out.autoc)
% Contrast: matlab/[1,2]                    (out.contr)
% Correlation: matlab                       (out.corrm)
% Correlation: [1,2]                        (out.corrp)
% Cluster Prominence: [2]                   (out.cprom)
% Cluster Shade: [2]                        (out.cshad)
% Dissimilarity: [2]                        (out.dissi)
% Energy: matlab / [1,2]                    (out.energ)
% Entropy: [2]                              (out.entro)
% Homogeneity: matlab                       (out.homom)
% Homogeneity: [2]                          (out.homop)
% Maximum probability: [2]                  (out.maxpr)
% Sum of sqaures: Variance [1]              (out.sosvh)
% Sum average [1]                           (out.savgh)
% Sum variance [1]                          (out.svarh)
% Sum entropy [1]                           (out.senth)
% Difference variance [1]                   (out.dvarh)
% Difference entropy [1]                    (out.denth)
% Information measure of correlation1 [1]   (out.inf1h)
% Informaiton measure of correlation2 [1]   (out.inf2h)
% Inverse difference (INV) is homom [3]     (out.homom)
% Inverse difference normalized (INN) [3]   (out.indnc) 
% Inverse difference moment normalized [3]  (out.idmnc)

%%extract 22 features from each 40glcms
 for j=1:4   
    for i=1:10
        F1(i,j)=stats(i,j).autoc;% Autocorrelation: [2]                      (out.autoc)
        F2(i,j)=stats(i,j).contr;% Contrast: matlab/[1,2]                    (out.contr)
        F3(i,j)=stats(i,j).corrm;% Correlation: matlab                       (out.corrm)
        F4(i,j)=stats(i,j).corrp;% Correlation: [1,2]                        (out.corrp)
        F5(i,j)=stats(i,j).cprom;% Cluster Prominence: [2]                   (out.cprom)
        F6(i,j)=stats(i,j).cshad;% Cluster Shade: [2]                        (out.cshad)
        F7(i,j)=stats(i,j).dissi;% Dissimilarity: [2]                        (out.dissi)
        F8(i,j)=stats(i,j).energ;% Energy: matlab / [1,2]                    (out.energ)
        F9(i,j)=stats(i,j).entro;% Entropy: [2]                              (out.entro)
        F10(i,j)=stats(i,j).homom;% Homogeneity: matlab                       (out.homom)
        F11(i,j)=stats(i,j).homop;% Homogeneity: [2]                          (out.homop)
        F12(i,j)=stats(i,j).maxpr;% Maximum probability: [2]                  (out.maxpr)
        F13(i,j)=stats(i,j).sosvh;% Sum of sqaures: Variance [1]              (out.sosvh)
        F14(i,j)=stats(i,j).savgh;% Sum average [1]                           (out.savgh)
        F15(i,j)=stats(i,j).svarh;% Sum variance [1]                          (out.svarh)
        F16(i,j)=stats(i,j).senth;% Sum entropy [1]                           (out.senth)
        F17(i,j)=stats(i,j).dvarh;% Difference variance [1]                   (out.dvarh)
        F18(i,j)=stats(i,j).denth;% Difference entropy [1]                    (out.denth)
        F19(i,j)=stats(i,j).inf1h;% Information measure of correlation1 [1]   (out.inf1h)
        F20(i,j)=stats(i,j).inf2h;% Informaiton measure of correlation2 [1]   (out.inf2h)
        F21(i,j)=stats(i,j).indnc;% Inverse difference normalized (INN) [3]   (out.indnc) 
        F22(i,j)=stats(i,j).idmnc;% Inverse difference moment normalized [3]  (out.idmnc)
        
    end
 end
 %% each 22 features of a same distance were averaged over all oreientations 
  F1= sum(F1,2)/4;
  F2= sum(F2,2)/4;
  F3= sum(F3,2)/4;
  F4= sum(F4,2)/4;
  F5= sum(F5,2)/4;
  F6= sum(F6,2)/4;
  F7= sum(F7,2)/4;
  F8= sum(F8,2)/4;
  F9= sum(F9,2)/4;
  F10= sum(F10,2)/4;
  F11= sum(F11,2)/4;
  F12= sum(F12,2)/4;
  F13= sum(F13,2)/4;
  F14= sum(F14,2)/4;
  F15= sum(F15,2)/4;
  F16= sum(F16,2)/4;
  F17= sum(F17,2)/4;
  F18= sum(F18,2)/4;
  F19= sum(F19,2)/4;
  F20= sum(F20,2)/4;
  F21= sum(F21,2)/4;
  F22= sum(F22,2)/4;
%%

 
 
 
 %
 bar3(F1);
 axis([0 5 0 10 0 1000]);
 Add title and axis labels
title('Contrast feature at each distance ');
xlabel('Direction (°)');
ylabel('Distance(pix)');
zlabel('Contrast');
Change the x and y axis tick labels
set(gca, 'XTickLabel', [0,45,90,135]);

         
