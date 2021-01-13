function res= Adam_Fourth_Order_Predictor_Corrector(t,f,w,h)
N = length(t);
for i=2:4
    k1 = h*f(t(1,i-1),w(1,i-1));
    k2 = h*f(t(1,i-1)+h/2,w(1,i-1)+k1/2);
    k3 = h*f(t(1,i-1)+h/2,w(1,i-1)+k2/2);
    k4 = h*f(t(1,i-1)+h,w(1,i-1)+k3);
    w(1,i) = w(1,i-1) + (k1+2*k2+2*k3+k4)/6;
end
for i=5:N
    t0 = t(1,i-4);
    t1 = t(1,i-3);
    t2 = t(1,i-2);
    t3 = t(1,i-1);
    
    w0 = w(1,i-4);
    w1 = w(1,i-3);
    w2 = w(1,i-2);
    w3 = w(1,i-1);
    
    w(1,i) = w3 +...
        h*(55*f(t3,w3)-59*f(t2,w2)+37*f(t1,w1)-9*f(t0,w0))/24;
    w(1,i) = w3+...
        h*(9*f(t(1,i),w(1,i))+19*f(t3,w3)-5*f(t2,w2)+f(t1,w1))/24;
end
res = w;