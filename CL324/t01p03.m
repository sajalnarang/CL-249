clear all;
clc;

time = [0 50 100 150 200 250 300];
conc = [0.05 0.038 0.0306 0.0256 0.0222 0.0195 0.0174];
initialConc = 0.05;

y = 1./conc;
[P,S] = polyfit(time,y,1);
fitConc = polyval(P,time);

plot(time,y,'o',time,fitConc,'-');
title('1/C_{A} vs t');
xlabel('Time(minutes)');
ylabel('1/C_{A}');
legend('Experimental Data','Prediction');