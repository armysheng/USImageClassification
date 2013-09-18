%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a simple example for using lDA to classification
%author :huangsheng @ iiec.cqu
%copy right:iiec.cqu
%date:2010-4-6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%实验数据来源http://people.revoledu.com/kardi/tutorial/LDA/Numerical%20Example.html
cls1_data=[2.95 6.63; 2.53 7.79; 3.57 5.65;3.16 5.47];%第一个类的训练集
cls2_data=[2.58 4.46; 2.16 6.22; 3.27 3.52];%第二个类的训练集
%求期望
E_cls1=mean(cls1_data);%第一类数据的期望矩阵
E_cls2=mean(cls2_data);%第二类数据的期望矩阵
E_all=mean([cls1_data;cls2_data]);%所有训练集的期望矩阵
%%%%%%%%%%%%%%%%%%%%分类前画图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:4
     plot(cls1_data(i,1),cls1_data(i,2),'.r');
     hold on;
end;
plot(E_cls1(1),E_cls1(2),'^r');
hold on;
for i=1:3
     plot(cls2_data(i,1),cls2_data(i,2),'*b');
     hold on;
end;
plot(E_cls2(1),E_cls2(2),'^b');
plot(E_all(1),E_all(2),'vc');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算类间离散度矩阵：
x1=E_all-E_cls1;
x2=E_all-E_cls2;
Sb=4*x1'*x1/7+3*x2'*x2/7;
%计算类内离散度矩阵
y1=0;
for i=1:4
    y1=y1+(cls1_data(i,:)-E_cls1)'*(cls1_data(i,:)-E_cls1);
end;
y2=0;
for i=1:3
    y2=y2+(cls2_data(i,:)-E_cls2)'*(cls2_data(i,:)-E_cls2);
end;
Sw=4*y1/7+3*y2/7;
%求最大特征值和特征向量
[V,L]=eig(inv(Sw)*Sb);

[a,b]=max(max(L));
newspace=V(:,b);%最大特征值所对应的特征向量
new_cls1_data=cls1_data*newspace;%训练后的数据集
new_cls2_data=cls2_data*newspace;%训练后的数据集
%%%%%%%%%%%%%%%%%%画图代码%%%%%%%%%%%%%%%%%
abort=V(:,1);%
k=newspace(2)/newspace(1);
k2=abort(2)/abort(1);%较小特征值所对应的特征向量的斜率
b2=E_all(2)-k2*E_all(1);
plot([4 2],[4*k2+b2 2*k2+b2],'-b');%画出较小特征值对应的特征向量
hold on;
%plot(E_all(1),E_all(2),'*r');%画出总期望点
plot([0,6],[0,6*k],'-c');%画出最大特征值对应的特征向量，即样本所组成的线性空间所投影的子空间
axis([2 6 0 11]);%防止坐标系
hold on;
%画出样本投影到子空间点
for i=1:4
    temp=cls1_data(i,:);
    newx=(temp(1)+k*temp(2))/(k*k+1);
    newy=k*newx;
    plot(newx,newy,'*r');
end;

for i=1:3
    temp=cls2_data(i,:);
    newx=(temp(1)+k*temp(2))/(k*k+1);
    newy=k*newx;
    plot(newx,newy,'ob');
end;
%预测
prediction=[2.81 5.46];
result=prediction*newspace;
temp=new_cls1_data-[result;result;result;result];
temp2=new_cls2_data-[result;result;result];
if(min(abs(temp))>min(abs(temp2)))
    output='该样本属于不合格产品'
else
    output='该样本属于合格产品'
end;




