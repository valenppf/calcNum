A=[0.5 -1 0
-1 3 -1
0 -1 2];
b=[7 4 5]';
tol=1e-8;

[x_gs,it_gs,r_gs]=gaussseidel(A,b,b,10000,tol);
disp(it_gs);

w=0.46;
[x_sor,it_sor,r_sor]=sor(A,b,b,10000,tol,w);
disp(it_sor);
