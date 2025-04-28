%%control 1 - 21/4/2025

%Armo A
diag_princ=2*ones(40,1);
diag_inf=-1*ones(40,1);
diag_sup=diag_inf;
A=spdiags([diag_inf diag_princ diag_sup],[-1,0,1],40,40);
full(A);

%Armo b
b_a=[1:1:40];
for i=1:40
  b_a(i)=1.5*i-6;
endfor
b=b_a';

%resuelvo por gauss
x=gauss1(A,b);
disp(x(20));

%armo x0
x0_a=(1:1:40);
for i=1:40
  x0_a(i)=0;
endfor
x0=x0_a';

tol=10^(-5);

%resuelvo usando jacobi
[x_j,it_j,er_j]=jacobi(A,b,x0,2000,tol);
disp(it_j);

%resuelvo usando gauss-seidel
[x_gs,it_gs,er_gs]=gaussseidel(A,b,x0,2000,tol);
disp(it_gs);

%resuelvo usando jacobi
[x_sor,it_sor,er_sor]=sor(A,b,x0,2000,tol,1.85);
disp(it_sor);
