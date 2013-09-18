%% classify example
load fisheriris
SL = meas(51:end,1);
SW = meas(51:end,2);
SL1= meas(51:end,3);
SW1= meas(51:end,4);
% group = species(51:end);
% h1 = gscatter(SL,SW,group,'rb','xo',[],'off');
% set(h1,'LineWidth',2)
% legend('Fisher versicolor','Fisher virginica',...
%        'Location','NW')
   
% [X,Y] = meshgrid(linspace(4.5,8),linspace(2,4));
% X = X(:); Y = Y(:);
% X=meas(:,1);
% Y=meas(:,2);
% [C,err,P,logp,coeff] = classify([X Y],[SL SW],...
%                                 group,'quadratic');
[C,err,P,logp,coeff] = classify(meas,[SL SW SL1 SW1],...
                                group,'quadratic');
%  estimate err of the misclassification
% error rate based on the training data. classify returns
% the apparent error rate, i.e., the percentage of observations in training that
% are misclassified, weighted by the prior probabilities for the groups.                           

figure(2) ;                           
% hold on;
h3=gscatter(X,Y,C,'rb','xo',[],'off');
set(h3,'LineWidth',2)

K = coeff(1,2).const;
L = coeff(1,2).linear; 
Q = coeff(1,2).quadratic;
% Function to compute K + L*v + v'*Q*v for multiple vectors
% v=[x;y]. Accepts x and y as scalars or column vectors.
f = @(x,y) K + [x y]*L + sum(([x y]*Q) .* [x y], 2);
hold on
h2 = ezplot(f,[4.5 8 2 4]);
set(h2,'Color','m','LineWidth',2)
axis([4.5 8 2 4])
xlabel('Sepal Length')
ylabel('Sepal Width')
title('{\bf Classification with Fisher Training Data}')