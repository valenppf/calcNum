################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 3 ######################
################## EJERCICIO 7 ###################

%% Creamos la matriz y el vect. de términos independientes
n = 10;
A = zeros(n,n) + diag(2*[1:n],0) + diag(0.5*[1:n-2],2) + diag(0.5*[3:n],-2)...
     + diag(0.25*[1:n-4],4) + diag(0.25*[5:n],-4);
b = pi*ones(n,1);
x0 = zeros(n,1);
tol = 1e-5;
maxit = 1000;
w = 1.04844;

[rho_J] = RadioEspectral(A,'ja',[]);
[rho_GS] = RadioEspectral(A,'gs',[]);
[rho_SOR] = RadioEspectral(A,'sor',w);

[x_J,it_J,r_J] = jacobi(A,b,x0,maxit,tol);
[x_GS,it_GS,r_GS] = gaussseidel(A,b,x0,maxit,tol);
[x_SOR,it_SOR,r_SOR] = sor(A,b,x0,maxit,tol,w);

xJ = linspace(1,it_J,it_J);
xGS = linspace(1,it_GS,it_GS);
xSOR = linspace(1,it_SOR,it_SOR);
semilogy(xJ,r_J(1:it_J),'o-k',xGS,r_GS(1:it_GS),'o-b',xSOR,r_SOR(1:it_SOR),'o-r')
hold on; grid on;
legend('Jacobi','Gauss Seidel', 'SOR');
xlabel('iteraciones');
ylabel('logaritmo del residuo');
