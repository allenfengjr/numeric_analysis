function [eig, v] = power_method(M,tol,N,X_init)
% 使用幂法求矩阵的最大实特征值(主特征值)
% tol: 允许的误差 eig: 返回的主特征值

x = X_init;
y = M * x;
k = 1;
while norm(x-y/(norm(y,inf)),inf) > tol && k<N
    x = y./norm(y,inf);
    y = M * x;
    %若max(x)=0，则没有特征值无解
    k = k + 1;
end
disp(k);
eig = norm(y,inf);
v = x;
end