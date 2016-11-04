function p = newton_raphson(t1,y1,h)
    y2 = 1;
    for i = 1:100
        derivative = (g(t1,y1,y2+h,h) - g(t1,y1,y2,h))/h;
        yn = y2 - g(t1,y1,y2,h)/derivative;
        y2 = yn;
    end
    p = y2;
return