function y = chazhi(abcd,x0,i,x)
y = abcd(1,i)+abcd(2,i).*(x-x0(1,i))+abcd(3,i)*(x-x0(1,i)).^2+abcd(4,i).*(x-x0(1,i)).^3;