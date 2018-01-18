clc
clear all

% calculation of weight of catalyst 
Po=40;

yo=[0;Po];
a=9.8*10^-5;
%w=1/a;
wspan=[0:100:10000];

    
[w,y]=ode45(@fun,wspan,yo)
