function x = Jacobi(A,b,N,x0)
%矩阵的不动点迭代
k = 1;
n = length(b);
x = zeros(n,1);%列向量
while k<=N
    maxdiff = 0;
    for i=1:n
        %模拟Tx+b，实际用T去乘和用E来迭代的复杂度都是O(n^2)
        x(i,1) = b(i,1);
        for j=1:i-1
            x(i,1) = x(i,1) - x0(j,1)*A(i,j);
        end
        for j=i+1:n
            x(i,1) = x(i,1) - x0(j,1)*A(i,j);
        end
        x(i,1) = x(i,1)/A(i,i);
        maxdiff = max(maxdiff,abs(x(i,1)-x0(i,1)));
    end
    if maxdiff<0.0001
        disp(k);
        break
    end
    k = k+1;
    x0 = x;
end