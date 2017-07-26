clear all;
clc;

time = [0 0.5 1.0 1.5 2.0 3.0 4.0 6.0 10.0];
conc = [0 0.145 0.270 0.376 0.467 0.610 0.715 0.848 0.957];

consumedConc = 1 - conc;
y = -1 * log(consumedConc);
[P,S] = polyfit(time,y,1);
fitConc = polyval(P,time);

plot(time,y,'o',time,fitConc,'-');
title('-ln(1-x_{A}) vs t');
xlabel('Time(minutes)');
ylabel('-ln(1-x_{A})');
legend('Experimental Data','Prediction');