clear all;
clc;

n = 100;
sum = 0;
for x1 = 0:1/n:1
    for y1 = 0:1/n:1
        for x2 = 0:1/n:1
            for y2 = 0:1/n:1
                sum = sum + sqrt((x1-x2)^2+(y1-y2)^2);
            end
        end
    end
end

average = sum/((n+1)^4)
disp(average)
