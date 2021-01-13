function [L,U,x] = LU_equ(A,b)
% 认为L的对角线全部是1
N = length(b);
L(1,1) = 1;
U(1,1) = A(1,1);
% U的第一行和L的第一列,因为这两个
for i=2:N
    U(1,i) = A(1,i);
    L(i,1) = A(i,1)/U(1,1);
end
for i=2:N-1
    L(i,i) = 1;
    U(i,i) = A(i,i);
    for k=1:i-1
        U(i,i) = U(i,i) - L(i,k)*U(k,i);
    end
    for j=i+1:N
        U(i,j) = A(i,j);
        L(j,i) = A(j,i);
        for k=1:i-1
            %LU相乘反推
            U(i,j) = U(i,j) - L(i,k)*U(k,j);
            L(j,i) = L(j,i) - L(j,k)*U(k,i);
        end
    L(j,i) = L(j,i) / U(i,i);
    end
end
L(N,N) = 1;
U(N,N) = A(N,N);
for k=1:N-1
    U(N,N) = U(N,N) - L(N,k)*U(k,N);
end
%下面的计算没有使用高斯消去法
%因为都是三角矩阵，所以单纯的从上到下遍历即可求得Ly=b的解y
%然后再从下到上遍历，即可求得Ux=y的解x
x = inv(U)*inv(L)*b;