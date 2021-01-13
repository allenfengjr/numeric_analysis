%修改n为区间数,下标都+1即可
function abcd =feiniujie_spline(n,x,a)
abcd = zeros(4,n+1);
b = zeros(1,n+1);
c = zeros(1,n+1);
d = zeros(1,n+1);
A=zeros(n+1,n+1);
h = zeros(1,n);
for i=1:n
    h(1,i) = x(1,i+1) - x(1,i);
end
A(1,1)=2*h(1,2);A(1,2)=-h(1,1)-h(1,2);A(1,3)=h(1,1);
for i=2:n
    A(i,i-1)=h(1,i-1);
    A(i,i)=2*(h(1,i-1)+h(1,i));
    A(i,i+1)=h(1,i);
end
A(n+1,1)=1;A(n+1,n-1)=h(1,n-2);A(n+1,n)=-h(1,n-2)-h(1,n-3);A(n+1,n+1)=h(1,n-3);
bb = zeros(n+1,1);
bb(1,1)=0;
for i=2:n
    bb(i,1)=3*(a(1,i+1)-a(1,i))/h(1,i)-3*(a(1,i)-a(1,i-1))/h(1,i-1);
end
bb(n+1,1)=0;
c = A\bb;
c = c';
for i=1:n
    b(1,i)=(a(1,i+1)-a(1,i))/h(1,i) - h(1,i)*(c(1,i+1)+2*c(1,i))/3;
    d(1,i) = (c(1,i+1)-c(1,i))/(3*h(1,i));
end
abcd = [a;b;c;d];