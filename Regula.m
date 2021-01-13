function [p,i] = Regula(p0,p1,f,err)
q0=f(p0);
q1=f(p1);
N0 = 100;
i=1;
while i<=N0 && abs(p1-p0)>err
    p=p1-q1*(p1-p0)/(q1-q0);
    q=f(p);
    if q*q0<=0
        %根在p与p0之间
        p0=p1;
        q0=q1;    
    end
    p1=p;
    q1=q;
    i=i+1;
end
