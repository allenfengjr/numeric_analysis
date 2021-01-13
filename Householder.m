function [Q, R] = Householder(A)
    % get shape of matrix
    [m, n] = size(A);
    % initialize Q and R matrices
    Q = eye(m);
    R = A;
    for i=1:min(m - 1, n)
        % compute Q and R by series of householder computations
        [Q, R] = qr_step(Q, R, i, m);
    end
end

function [Q, R] = qr_step(Q, R, i, m)
    % compute v vector from each column of R
    v = get_v_vector(R, i);
    % initialize householder matrix
    H = eye(m);
    % fill householder matrix calculated from v
    % 只对右下角进行操作
    H(i:end, i:end) = house_holder(v);
    % compute new R and Q transpose
    %R实际也可以通过别的办法来做，比如逐列乘Hu =  u − 2v*(v'u)/(v'v)
    R = H * R;
    Q = Q * H;
end

function v = get_v_vector(R, i)
    % extract column vector x
    %第i列的向量ai，仅需要下面部分
    x = R(i:end, i);
    % initialize e1 vector
    %e1实际上是ei
    e1 = zeros(size(x));
    e1(1) = 1;
    % compute v = x_i - ||x_i||e_1
    v = x - norm(x) * e1;
end

function H = house_holder(v)
    % identity matrix
    I = eye(length(v));
    % compute H = I - 2 * (v * v') / (v' * v)
    H = I - 2 * (v * v') / (v' * v);
end