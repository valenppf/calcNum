################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 2 ######################
################## EJERCICIO 8 ###################

b = [1 2 3]';
%%%%% 1)
##A = [8 4 1; 2 6 2; 2 4 8];

%%%%% 2)
##A = [5.00e-2 5.57e2 -4.00e-2; 1.98 1.94e2 -3.00e-3; 2.74e2 3.11 7.50e-2];

%%%%% 3)
##A = [1 2 -1; 2 4 0; 0 1 -1];

[Ad] = doolittle(A);
L = eye(3)+tril(Ad,-1);
U = triu(Ad);
Residuo = A-L*U
L = [L b];
y = sust_adel_vec(L);
U = [U y];
x = sust_atras_vec(U)


[Adp,r] = doolittle_p(A);
P = eye(3)(r,:);
Pb = P*b;
Lp = eye(3)+tril(Adp(r,1:3),-1);
Up = triu(Adp(r,1:3));
Residuo_piv = P*A-Lp*Up
Lp = [Lp Pb];
y = sust_adel_vec(Lp);
Up = [Up y];
xp = sust_atras_vec(Up)

