function Coff = leas_squares(x,y,N)
% 用矩阵解法方程组
SUMX =zeros(N,N);
SUMY = zeros(N,1);
m = length(x);
for i=1:N
    %法方程左侧的系数矩阵
    for j=1:N
        for k=1:m
            SUMX(i,j) = SUMX(i,j) + x(1,k).^(i+j-2);
        end
    end
    %法方程右侧
    for j=1:m
        SUMY(i,1) = SUMY(i,1) + y(1,j)*x(1,j).^(i-1);
    end
end
Coff = SUMX\SUMY;