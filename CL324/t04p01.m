clear all;
clc;

Ca = 90:-10:0;
Cr = [7 13 18 22 25 27 28 28 27 25];
Ca0 = 100;
Caf = 20;
FIm = Cr./(Ca0 - Ca);
plot(Ca,FIm);
FIext = polyfit(Ca,FIm,1);
FI0 = polyval(FIext,100);
Ca = [Ca0 Ca];
FIm = [FI0 FIm];

Crf = -1 * trapz(Ca(1:9),FIm(1:9))