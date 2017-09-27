clear all;
clc;

time = [0 50 100 150 200 250 300];
conc = [0.05 0.038 0.0306 0.0256 0.0222 0.0195 0.0174];
initialConc = 0.5;
n = length(time);

x = log(conc);
r = zeros(1,n);
for i = 2:n-1
    r(i) = (conc(i+1) - 2 * conc(i) + conc(i-1))/(time(i+1) - 2*time(i) + time(i-1));
end
r(1) = (conc(2) - conc(1))/(time(2) - time(1));
r(n) = (conc(n) - conc(n-1))/(time(n) - time(n-1));
y = log(-1.*r);

[P,S] = polyfit(x,y,1);
fitConc = polyval(P,x);

plot(x,y,'o',x,fitConc,'-');
title('$\frac{-dC_{A}}{dt} vs log(C_{A})$','Interpreter','LaTex');
xlabel('log(C_{A})');
ylabel('$\frac{-dC_{A}}{dt}$','Interpreter','LaTex','FontSize',20);
legend('Experimental Data','Prediction');