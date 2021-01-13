function x = Guass_Seidel(A,b,N)
k = 1;
n = length(b);
x = zeros(n,1);
while k<=N
    maxdiff = 0;
    for i=1:n
        %根本不需要X0来作为中间变量存旧值,遍历过的就是新的，没遍历到的就是旧的
        nvalue =  x(i,1);
        x(i,1) = b(i,1);

        for j=1:i-1
            x(i,1) = x(i,1) - x(j,1)*A(i,j);
        end
        for j=i+1:n
            x(i,1) = x(i,1) - x(j,1)*A(i,j);
        end
        x(i,1) = x(i,1)/A(i,i);
        maxdiff = max(maxdiff,abs(x(i,1)-nvalue));
    end
    if maxdiff<0.0001
        disp(k);
        break
    end
    k = k+1;
end