clear all
clc
n=101
dx=1/(n-1);

A=[];
for i=1:n+1
    x(i)=(i-1)/(n-1);
end

A(1,1)=-1-6*dx;
A(1,2)=1;
A(n+1,n+1)=1;
A(n+1,n)=-1;

for i=2:n
    
    A(i,i)=dx-1/3;
    A(i,i+1)=1/6+dx;
    A(i,i-1)=1/6;
end

 for i=1:n+1
          y(i)=-25;
          s(i)=(2*y(i)^2)*dx^2;
      end
      
    
s(1)=-6*dx;
s(n+1)=0;  
     s;
     s';
          y=inv(A)*s';
          for k=1:100
          y=inv(A)*s';
          for i=2:n
               s(i)=2*y(i)^2*dx^2;
          end
          s(n+1)=0;
      end


y


























