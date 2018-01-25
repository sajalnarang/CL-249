clear all;
clc;

% CSTR
% Experimental Data
VC = 2050;
vC = [200 ; 150 ; 120] / 60 * 2;
tC = [308 ; 397 ; 494];
for i = 2:4
    tC(:,i) = i * tC(:,1);
end
TtC = [8.2 8.3 8.3 8.4
       8.4 8.6 8.7 8.9
       8.4 8.8 8.8 8.9];
XeqC = 0.9;

% Theoretical Plot
K = 0.162;
CA0C = 0.05;
XthC = 0:0.0001:XeqC;
tauthC = XthC / K / CA0C ./ (1 - XthC) .^ 2 / 60;
plot(tauthC,XthC);
hold on;

% Experimental Plot
CAC = (1 - TtC * 0.1) / 10;
XC = (CA0C - CAC) / CA0C;
tauC = VC ./ vC / 60;
plot(tauC,mean(XC,2), 'o');
title('CSTR');
ylabel('X');
xlabel('\tau (in minutes)');
legend('Theoretical Plot','Experimental Data','location','southeast');

% PFR
% Experimental Data
VP = 675;
vP = [200 ; 150 ; 120] / 60 * 2;
tP = [104 ; 133 ; 171];
for i = 2:4
    tP(:,i) = i * tP(:,1);
end
TtP = [8.1 8.5 8.6 9.0
       8.5 8.6 8.8 9.2
       8.8 9.0 9.1 9.2];
XeqP = 0.92;

% Theoretical Plot
K = 0.162;
CA0P = 0.05;
XthP = 0:0.0001:XeqP;
tauthP = XthP / K / CA0P ./ (1 - XthP) / 60;
figure;
plot(tauthP,XthP);
hold on;

% Experimental Plot
CAP = (1 - TtP * 0.1) / 10;
XP = (CA0P - CAP) / CA0P;
tauP = VP ./ vP / 60;
plot(tauP,mean(XP,2), 'o');
title('PFR');
ylabel('X');
xlabel('\tau (in minutes)');
legend('Theoretical Plot','Experimental Data','location','southeast');