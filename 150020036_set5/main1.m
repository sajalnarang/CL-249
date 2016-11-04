clear all
clc
r=1/3;
n=1001;
T=zeros(n,101);
T(1,:)=25;
T(:,1)=0;
T(1,1)=25;
T(:,n)=100;
for i=1:n-1
    for j=2:n-1
        T(i+1,j)=T(i,j)+r*(T(i,j+1)-2*T(i,j)+T(i,j-1));
    end
end
T