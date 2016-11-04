%Gauss Siedel

clear all
clc
A = [10 -1 3;5 11 2;2 -3 7];
b = [5 2 3]';
x = [1 2 3];
n = length(A);

% for i = 1:n
%     for j = 1:n
%         if i >= j
%             L(i,j) = A(i,j);
%             U(i,j) = 0;
%         else
%             U(i,j) = A(i,j);
%             L(i,j) = 0;
%         end
%     end
% end
% U
% L
% A

while true
    xo = x;
    for i = 1:n
        sum = 0;
        for j = 1:n
            if(i ~= j)
                sum = sum + A(i,j)*x(j);
            end
        end
        x(i) = (b(i) - sum)/A(i,i);
    end
    sum1 = 0;
    x1 = xo-x;
    for i = 1:n
        sum1 = sum1 + x1(i);
    end
    if(sum1 == 0)
        break;
    end
end

x