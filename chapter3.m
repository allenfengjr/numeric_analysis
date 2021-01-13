%插值多项式
fy = @(x)(sin(x));
dy = @(x)(cos(x));
d2y = @(x)(-sin(x));
x1 = linspace(0,pi,11);
x2 = linspace(0,pi,21);
%自然边界
a1 = zeros(1,11);
for i=1:11
    a1(1,i) = fy(x1(1,i));
end
a2 = zeros(1,21);
for i=1:21
    a2(1,i) = fy(x2(1,i));
end
free = free_spline(10,x1,a1);
guzhi = guzhi_spline(10,x1,a1,dy(0),dy(pi));
zhouqi = zhouqi_spline(10,x1,a1);
feiniujie = feiniujie_spline(10,x1,a1);
free_ = free_spline(20,x2,a2);
guzhi_ = guzhi_spline(20,x2,a2,dy(0),dy(pi));
zhouqi_ = zhouqi_spline(20,x2,a2);
feiniujie_ = feiniujie_spline(20,x2,a2);
%11个点
figure
hold on
for i=1:10
    x_tmp = linspace(x1(i),x1(i+1),5);
    disp(x_tmp);
    y_free = chazhi(free,x1,i,x_tmp);
    y_guzhi = chazhi(guzhi,x1,i,x_tmp);
    y_zhouqi = chazhi(zhouqi,x1,i,x_tmp);
    y_feiniujie = chazhi(feiniujie,x1,i,x_tmp);
    %plot(x_tmp,y_feiniujie,'r')
    %plot(x_tmp,y_free,'g')
    %plot(x_tmp,y_guzhi,'b')
    plot(x_tmp,y_zhouqi,'k')

end
%21个点
figure
hold on
for i=1:20
    x_tmp = linspace(x2(i),x2(i+1),5);
    disp(x_tmp);
    y_free = chazhi(free_,x2,i,x_tmp);
    y_guzhi = chazhi(guzhi_,x2,i,x_tmp);
    y_zhouqi = chazhi(zhouqi_,x2,i,x_tmp);
    y_feiniujie = chazhi(feiniujie_,x2,i,x_tmp);
    %plot(x_tmp,y_feiniujie,'r')
    %plot(x_tmp,y_free,'g')
    %plot(x_tmp,y_guzhi,'b')
    plot(x_tmp,y_zhouqi,'k')

end