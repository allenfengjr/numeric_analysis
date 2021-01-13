function integral =simpson(Fx,h)
n = length(Fx);
XI0 = Fx(1)+Fx(n);
XI1 = 0;
XI2 = 0;
for i =2:n-1
    if mod(i,2)==1
        XI1 = XI1 + Fx(i);
    else
        XI2 = XI2 + Fx(i);
    end
end
integral = (XI0 + 2*XI1 + 4*XI2) * (h/3);