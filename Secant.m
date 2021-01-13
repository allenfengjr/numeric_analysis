function [p,i] = Secant(p0,p1,f,err)
q0=f(p0);
q1=f(p1);
N0 = 100;
i=1;
while i<=N0 && abs(p0-p1)>err
    p=p1-q1*(p1-p0)/(q1-q0);
    p0=p1;
    p1=p;
    q0=q1;
    q1=f(p);
    i=i+1;
end
