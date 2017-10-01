clear all;
clc;

% Part 1 : Calculation of k values
rT = [71 71.3 41.6 19.7 42 17.1 71.8 142 284 47 71.3 117 127 131 133 41.8]';
pT = [1 1 1 1 1 1 1 1 1 0.5 1 5 10 15 20 1]';
pH = [1 1 1 1 1 1 1 2 4 1 1 1 1 1 1 1]';
pB = [0 0 1 4 1 5 0 0 0 0 0 0 0 0 0 1]';

n = length(rT);
Y = rT;
X = ones(n,3);
X(:,1) = 1./pT./pH;
X(:,2) = pB./pT./pH;
X(:,3) = 1./pH;

beta = mvregress(X,Y);
k = 1 / beta(1);
kB = k * beta(2);
kT = k * beta(3);