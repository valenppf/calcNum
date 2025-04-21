################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 2 ######################
################## EJERCICIO 13 ##################

n = 6;

diag_sup = [0;0;-1*ones(n-2,1)];
diag_ppal = 2*ones(n,1);
diag_inf = -1*ones(n-2,1);
M = spdiags(diag_inf,-1,n,n)+spdiags(diag_ppal,0,n,n)+spdiags(diag_sup,1,n,n);
M = full(M);

%a)

##b = ones(n,1);
##b = b*(1/(n^2));
##b(1) = 0;
##b(n) = 0;
##
##[Md] = doolittle(M);
##L = eye(n)+tril(Md,-1);
##U = triu(Md);
##Residuo = M-L*U
##L = [L b];
##y = sust_adel_vec(L);
##U = [U y];
##x = sust_atras_vec(U)

%b)

##b = ones(n,1);
Max = zeros(n,1);

for k = 1:n
  b = ones(n,1)*(1/(n^k));
  b(1) = 0;
  b(n) = 0;
  [Md] = doolittle(M);
  L = eye(n)+tril(Md,-1);
  U = triu(Md);
  L = [L b];
  y = sust_adel_vec(L);
  U = [U y];
  x = sust_atras_vec(U);
  Max(k,1) = max(x);
endfor

% Gráfico semilogarítmico
figure;
semilogy(1:n, Max, 'o-b', 'LineWidth', 0.5);
xlabel('k');
ylabel('Máximo de x');
title('Máximo de la solución x vs. k');
grid on;
