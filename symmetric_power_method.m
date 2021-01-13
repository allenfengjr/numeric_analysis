function [eig, v] = symmetric_power_method(M,tol,N,X_init)
%对称幂法,求对称矩阵的主特征值和特征向量

x = X_init;
y = M * x;
k = 1;
while norm(x-y/(norm(y,2)),2) > tol && k<N
    x = y./norm(y,2);
    y = M*x;
    %若||x||2=0，则没有特征值无解
    k = k + 1;
end
disp(k);
eig = x'*y;
v = x;
end