% 复合梯形公式与Simpson公式==>辛普森不用复合,单纯分段
%第一题
a = 0;b = 1;
h = 2e-2;
n = round((b-a)/h); %区间数量,点的数量要再+1
Fx1 = zeros(1,n+1);
f1 = @(x)(exp(-0.5*x.^2));
for i=1:n+1
    Fx1(1,i) = f1(a+(i-1)*h);
end
ansTrapezoid1 = trapezoid(Fx1,h)/ sqrt(2*pi);
ansSimpson1 = simpson(Fx1,h)/ sqrt(2*pi);
%第二题
a = 1;b = 6;
h = [0.5;0.25;0.125];
f2 = @(x)(2+sin(2*sqrt(x)));
ansSimpson2 = zeros(1,3);
ansTrapezoid2 = zeros(1,3);
n = (b-a)./h; %切片数量
Fx2 = {zeros(1,n(1,1)+1),zeros(1,n(2,1)+1),zeros(1,n(3,1)+1)};
for i=1:3
    nn = n(i,1);
    hh = h(i,1);
    for j=1:nn+1
        Fx2{1,i}(1,j) = f2(a+(j-1)*hh);
    end
    ansSimpson2(1,i) = simpson(Fx2{1,i},hh);
    ansTrapezoid2(1,i) = trapezoid(Fx2{1,i},hh);
end

q2 = integral(f2,1,6);
q1 = integral(f1,0,1)/sqrt(2*pi);