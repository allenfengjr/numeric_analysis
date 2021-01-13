function xp =quickpower(x,p)
xp = 1;
while p ~= 0
    if mod(p,2)==1
        xp = xp*x;
    end
    x = x * x;
    p = bitshift(p,-1);
end