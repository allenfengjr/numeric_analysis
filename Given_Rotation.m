function [Q, R] = Given_Rotation(A)
n=size(A,2); %列数
m=size(A,1); %行数
R=A;
Q=eye(m);
for i=1:n 
    for j=i+1:m 
        x=R(:,i);
        rt=givens(x,i,j);%J矩阵
        disp(rt);
        Q=Q*rt';
        R=rt*R;
    end
end

function [R,y]=givens(x,i,j)
xi=x(i);          
xj=x(j);
r=sqrt(xi^2+xj^2);
cost=xi/r;
sint=xj/r;
R=eye(length(x));
R(i,i)=cost;
R(i,j)=sint;
R(j,i)=-sint;
R(j,j)=cost;
y=x(:);
y([i,j])=[r,0];%sint cost