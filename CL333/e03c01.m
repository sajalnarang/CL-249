clear all;
clc;

Qao = [7.39 6.56 6.34 5.68 4.23] * 0.0001;
Qmo = [5.56 4.90 4.62 4.00 2.92] * 0.0001;

Qav = [5.46 4.92 4.67 3.58 3.14] * 0.0001;
Qmv = [6.14 5.19 5.00 3.64 2.57] * 0.0001;

[Po,So] = polyfit(Qao,Qmo,1);
yo = polyval(Po,Qao);

[Pv,Sv] = polyfit(Qav,Qmv,1);
yv = polyval(Pv,Qav);

hold on;
plot(Qao,Qmo,'bo',Qav,Qmv,'ro');
plot(Qao,yo,'b-',Qav,yv,'r-');

title('Determination of Discharge Coefficient (C_{v})');
xlabel('Actual Flowrate (Q_{a})');
ylabel('Measured Flowrate (Q_{m})');
legend('Orifice Meter','Venturi meter');