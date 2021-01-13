%第八章
% 第一题
x1 = [-2,-1,0,1,2];
y1 = [0,1,2,1,0];
% Pn = a0+a1*x+a2*x^2 
res = leas_squares(x1,y1,3);
x = linspace(-2.5,2.5,100);
y = res(1,1) + res(2,1)*x +res(3,1)*x.^2;
%与MATLAB中的ployfit对比,因为完全对称所以a1 = 0，ployfit函数出现了很小的舍入误差
default_FUN = polyfit(x1,y1,2);
figure
hold on
plot(x,y);
plot(x1,y1,'.');
%第二题
x2 = [0,1,2,4];
y2 = [2.01,1.21,0.74,0.45];
y2 = log(y2);
exp_FUN = leas_squares(x2,y2,2);
exp_FUN(1,1) = exp(exp_FUN(1,1));
exp_FUN(2,1) = -exp_FUN(2,1);
xe = linspace(-1,5);
ye = exp_FUN(1,1)*exp(-exp_FUN(2,1)*xe);
figure
hold on
plot(x2,exp(y2),'.');
plot(xe,ye);