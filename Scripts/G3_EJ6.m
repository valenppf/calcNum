################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 3 ######################
################## EJERCICIO 6 ###################

A1 = [3 1 1; 1 3 -1; 3 1 -5];
b1 = [5; 3; -1];
A2 = [3 1 1; 3 1 -5; 1 3 -1];
b2 = [5; -1; 3];
x0 = [0; 0; 0];
tol = 1e-6;
maxit = 100;

[rho_GS1] = RadioEspectral(A1,'gs',[]);
[rho_GS2] = RadioEspectral(A2,'gs',[]);

[x_GS1,it_GS1,r_GS1] = gaussseidel(A1,b1,x0,maxit,tol);
[x_EG1] = Elimin_gauss_vec(A1,b1);
[x_GS2,it_GS2,r_GS2] = gaussseidel(A2,b2,x0,maxit,tol);
[x_EG2] = Elimin_gauss_vec(A2,b2);
[x2] = gauss_p(A2,b2);
