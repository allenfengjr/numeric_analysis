function res= Runge_Kutta(t,f,w,h)
N = length(t);
for i=2:N
    k1 = h*f(t(1,i-1),w(1,i-1));
    k2 = h*f(t(1,i-1)+h/2,w(1,i-1)+k1/2);
    k3 = h*f(t(1,i-1)+h/2,w(1,i-1)+k2/2);
    k4 = h*f(t(1,i),w(1,i-1)+k3);
    w(1,i) = w(1,i-1) + (k1+2*k2+2*k3+k4)/6;
end
res = w;