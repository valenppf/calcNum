################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 2 ######################
################## EJERCICIO 11 ##################

A = [1 1+0.5e-15 3; 2 2 20; 3 6 4];

[Ad] = doolittle(A);
L = eye(3)+tril(Ad,-1);
U = triu(Ad);
Residuo = A-L*U

[Adp,r] = doolittle_p(A);
P = eye(3)(r,:);
Lp = eye(3)+tril(Adp(r,1:3),-1);
Up = triu(Adp(r,1:3));
Residuo_piv = P*A-Lp*Up
