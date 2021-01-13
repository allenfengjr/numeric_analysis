% 第一章上机实验
% 第一题:求解方程的根
% x^2+(α+β)x+10^9=0 
% 减小误差即避免两个近乎相等的数相减,减少舍入误差
a = -10^9;
b = -1;
c = 10^9;
delta = sqrt( (a+b)^2 - 4*10^9);
x1 = -2*c/((a+b)-delta);
x2 = (-(a+b)+delta)/2;
% 第二题:快速幂
x = 2;
p = 31;
y = 1;
while p ~= 0
    if mod(p,2)==1
        y = y*x;
    end
    x = x * x;
    p = bitshift(p,-1);
end