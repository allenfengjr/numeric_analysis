%第6，7章
A = [4,-1,1;
    4,-8,1;
    -2,1,5];
b =[7;-21;15];
%LU分解
[L,U,x] = LU_equ(A,b);
X_init = zeros(3,1);
x1 = Jacobi(A,b,30,X_init);
x2 = Guass_Seidel(A,b,30);
