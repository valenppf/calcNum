A=[1 2 -2 -1 0;
-1 3 -1 -1 -2;
0 -2 3 2 0;
-1 0 -1 2 -1;
2 0 -2 -1 3];
b=[1 -2 5 5 -1]';

xa=gauss1(A,b);
xa=gauss_p(A,b)

%b)
tol=1e-4;
x0=zeros(5,1);
[xb_j,it_j,er_j]=jacobi(A,b,x0,10000,tol);
xb_j
it_j

%[xb_gs,it_gs,er_gs]=gaussseidel(A,b,x0,100,tol);
%xb_gs
%it_gs
rho=radioEspectral(A,'gs',0)
disp('gauss seidel no converge porque el radio espectral de la Tgs de A es mayor a 1')

e=(norm(xb_j-xa,'inf'))/norm(xb_j,'inf')
