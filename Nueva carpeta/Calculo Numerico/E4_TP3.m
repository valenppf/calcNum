################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 3 ######################
################## EJERCICIO 4 ###################

A = [10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b = [6; 25; -11; -11];
x0 = [0; 0; 0; 0];
maxit = 1000;
tol = 1e-6;
w = 1.1535;
##w = 1; %SOR = GS

[rho_SOR] = RadioEspectral(A,'sor',w);
[rho_GS] = RadioEspectral(A,'gs',[]);

[x_SOR,it_SOR,rh_SOR] = sor(A,b,x0,maxit,tol,w);
[x_GS,it_GS,rh_GS] = gaussseidel(A,b,x0,maxit,tol);
