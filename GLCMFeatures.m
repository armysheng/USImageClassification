

 %% generating glcms  4 directions and 10 pixs distances
 glcm = zeros(256,256,10,4);
 for j=1:4
     for i= 1:10
         offset=[0,i;-i,i;-i,0;-i,-i];
         glcm(:,:,i,j)=graycomatrix(I,'NumLevels',256,'Offset',offset(j,:),'Symmetric',false);
     end
 end

   %%  计算（计算22个特征）
%   stats=zeros(4,10);
uc(1:1)=zeros(1,1);
stats=struct('autoc',uc,'contr',uc,'corrm',uc,'corrp',uc,'cprom',uc,'cshad',uc,'dissi',uc,'energ',uc,'entro',uc,'homom',uc,'homop',uc,'maxpr',uc,'sosvh',uc,'savgh',uc,'svarh',uc,'senth',uc,'dvarh',uc,'denth',uc,'inf1h',uc,'inf2h',uc,'indnc',uc,'idmnc',uc);
 for j= 1:4
     for i = 1:10
         stats(i,j)=glcm_features1(glcm(:,:,i,j),0);
%          stats_default(i,j) = graycoprops(glcm(:,:,i,j),'all');%old version
     end
 end
 
% % % % % %% default features  
% % % % % %  for j=1:4   
% % % % % %     for i=1:10;
% % % % % %         F_contrast(i,j)=stats_default(i,j).Contrast;
% % % % % %         F_Correlation1(i,j)=stats_default(i,j).Correlation1;
% % % % % % %         F_Correlation2(i,j)=stats_default(i,j).Correlation2;
% % % % % %         F_Energy(i,j)=stats_default(i,j).Energy;
% % % % % %         F_Homogeneity(i,j)=stats_default(i,j).Homogeneity;
% % % % % %     end
% % % % % %  end
% % % % % %  
% % % % % %  s
% % % % % %      F_contrast= sum(F_contrast,2)/4;

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
        S1(i,j)=stats(i,j).autoc;% Autocorrelation: [2]                      (out.autoc)
        S2(i,j)=stats(i,j).contr;% Contrast: matlab/[1,2]                    (out.contr)
        S3(i,j)=stats(i,j).corrm;% Correlation: matlab                       (out.corrm)
        S4(i,j)=stats(i,j).corrp;% Correlation: [1,2]                        (out.corrp)
        S5(i,j)=stats(i,j).cprom;% Cluster Prominence: [2]                   (out.cprom)
        S6(i,j)=stats(i,j).cshad;% Cluster Shade: [2]                        (out.cshad)
        S7(i,j)=stats(i,j).dissi;% Dissimilarity: [2]                        (out.dissi)
        S8(i,j)=stats(i,j).energ;% Energy: matlab / [1,2]                    (out.energ)
        S9(i,j)=stats(i,j).entro;% Entropy: [2]                              (out.entro)
        S10(i,j)=stats(i,j).homom;% Homogeneity: matlab                       (out.homom)
        S11(i,j)=stats(i,j).homop;% Homogeneity: [2]                          (out.homop)
        S12(i,j)=stats(i,j).maxpr;% Maximum probability: [2]                  (out.maxpr)
        S13(i,j)=stats(i,j).sosvh;% Sum oS sqaures: Variance [1]              (out.sosvh)
        S14(i,j)=stats(i,j).savgh;% Sum average [1]                           (out.savgh)
        S15(i,j)=stats(i,j).svarh;% Sum variance [1]                          (out.svarh)
        S16(i,j)=stats(i,j).senth;% Sum entropy [1]                           (out.senth)
        S17(i,j)=stats(i,j).dvarh;% DiSference variance [1]                   (out.dvarh)
        S18(i,j)=stats(i,j).denth;% Difference entropy [1]                    (out.denth)
        S19(i,j)=stats(i,j).inf1h;% Information measure of correlation1 [1]   (out.inf1h)
        S20(i,j)=stats(i,j).inf2h;% Informaiton measure of correlation2 [1]   (out.inf2h)
        S21(i,j)=stats(i,j).indnc;% Inverse difference normalized (INN) [3]   (out.indnc) 
        S22(i,j)=stats(i,j).idmnc;% Inverse difference moment normalized [3]  (out.idmnc)
        
    end
 end
 %% each 22 Seatures of a same distance were averaged over all oreientations 
  S1= sum(S1,2)/4;
  S2= sum(S2,2)/4;
  S3= sum(S3,2)/4;
  S4= sum(S4,2)/4;
  S5= sum(S5,2)/4;
  S6= sum(S6,2)/4;
  S7= sum(S7,2)/4;
  S8= sum(S8,2)/4;
  S9= sum(S9,2)/4;
  S10= sum(S10,2)/4;
  S11= sum(S11,2)/4;
  S12= sum(S12,2)/4;
  S13= sum(S13,2)/4;
  S14= sum(S14,2)/4;
  S15= sum(S15,2)/4;
  S16= sum(S16,2)/4;
  S17= sum(S17,2)/4;
  S18= sum(S18,2)/4;
  S19= sum(S19,2)/4;
  S20= sum(S20,2)/4;
  S21= sum(S21,2)/4;
  S22= sum(S22,2)/4;
  GLCMFM=[S1',S2',S3',S4',S5',S6',S7',S8',S9',S10',S11',S12',S13',S14',S15',S16',S17',S18',S19',S20',S21',S22'];
