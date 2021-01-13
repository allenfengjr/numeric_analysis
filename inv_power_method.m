function [eig, v] = inv_power_method(M,tol,N,X_init)
x = X_init;
q = 5.5;%(x'*M*x)/(x'*x);
I = eye(length(M));
x = x./max(abs(x));
k = 1;
while k<N
    y = (M-q*I)\x;
    eig = norm(y,inf);
    err = norm(x-y./(norm(y,inf)),inf) ;
    x = y./norm(y,inf);
    if err <tol
        break
    end
    
    k = k + 1;
end
disp(k);
eig = 1/eig + q;
v = x;
end