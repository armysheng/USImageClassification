% clc;
% I = imread('roi.png');
% I = rgb2gray(I);
% imhist(I);
% I =[1     1     1     2     2
%      3     4     2     2     3
%      4     4     4     4     4
%      5     5     3     3     3
%      1     1     3     4     5]
%  I=uint8(I);
 [GLRLMS,SI] = grayrlmatrix(I,'NumLevels',256,'G',[]);
 stauts=grayrlprops(GLRLMS);
 S23=stauts(:,1);
 S24=stauts(:,2);
 S25=stauts(:,3);
 S26=stauts(:,4);
 S27=stauts(:,5);
 S28=stauts(:,6);
 S29=stauts(:,7);
 S30=stauts(:,8);
 S31=stauts(:,9);
 S32=stauts(:,10);
 S33=stauts(:,11);
 
 GLRLFM=[S23',S24',S25',S26',S27',S28',S29',S30',S31',S32',S33'];
 