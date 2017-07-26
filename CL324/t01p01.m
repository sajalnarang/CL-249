clear all;
clc;

k = [0.00043 0.00103 0.00180 0.00355 0.00717];
T = [313 319 323 328 333];

n = length(T);
x = 1./T;
y = log(k);

[P,S] = polyfit(x,y,1);
fitY = polyval(P,x);
plot(x,y,'o',x,fitY,'-');
title('ln(k) vs 1/T');
xlabel('1/T (K^{-1})');
ylabel('ln(k)');
legend('Experimental Data', 'Prediction');