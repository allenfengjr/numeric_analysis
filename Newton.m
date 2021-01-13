function [p,i] = Newton(p0,f,df,err)
N0 = 100;
i=1;
while i<=N0 
    p=p0-f(p0)/df(p0);
    if abs(p0-p)<err
        break
    end
    p0=p;
    i=i+1;
end
