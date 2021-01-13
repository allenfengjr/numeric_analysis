function integral =trapezoid(Fx,h)
n = length(Fx);
integral = Fx(1)+Fx(n);
for i =2:n-1
    integral = integral + 2*Fx(1,i);
end
integral = integral * (h/2);