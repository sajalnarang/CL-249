function dy=fun(w,y)

% calculation of k values 
data = xlsread('data.xlsx');
r = data(:,1);
pT = data(:,2);
pH2 = data(:,3);
pB = data(:,4);

n = length(r);
Y = r;
X = ones(n,3);
X(:,1) = 1./pT./pH2;
X(:,2) = pB./pT./pH2;
X(:,3) = 1./pH2;

beta = mvregress(X,Y);  % multivariate linear regression 
k = 1 / beta(1);
KB = k * beta(2);
KT = k * beta(3);

% function 
Po=40;

yTo=0.3;
pTo=yTo*Po;
yHo=0.45;
yBo=0;
yMo=0;
yI=0.25;
FTo=50;
alpha=9.8*10^-5;
e=0;

%y(1)= X;
%y(2)= P;
pH2=pTo*(((yHo/yTo)-y(1))/(1+e*y(1)))*(y(2)/Po);
pT=pTo*(((yTo/yTo)-y(1))/(1+e*y(1)))*(y(2)/Po);
pB=pTo*(((yBo/yTo)+y(1))/(1+e*y(1)))*(y(2)/Po);

r=(k*pH2*pT)/(1+(KB*pB)+(KT*pT));

dy(1,1)= r/FTo;
dy(2,1)= -(alpha*Po*Po*(1+e*y(1)))/(2*y(2));

end