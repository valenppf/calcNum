################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 2 ######################
################## EJERCICIO 7 ###################

n = 100;
##M = zeros(n,n);
##M(1,1) = 1;
##M(n,n) = 1;
##
##for i = 2:n-1
##  for j = 2:n-1
##    if i == j
##    M(i,j) = 2;
##    M(i,j-1) = -1;
##    M(i,j+1) = -1;
##    endif
##  endfor
##endfor

%% ==== Sparse ====
##M = sparse(1:n,1:n,2,n,n);             % Diagonal principal
##M = M+sparse(2:n,1:n-1,-1,n,n);        % Diagonal inferior
##M = M+sparse(1:n-1,2:n,-1,n,n);        % Diagonal superior
##M(1,1) = 1;
##M(n,n) = 1;
##M(1,2) = 0;
##M(n,n-1) = 0;

%% ==== Spdiag ====
diag_sup = [0;0;-1*ones(n-2,1)];
diag_ppal = 2*ones(n,1);
diag_inf = -1*ones(n-2,1);
M = spdiags(diag_inf,-1,n,n)+spdiags(diag_ppal,0,n,n)+spdiags(diag_sup,1,n,n);

b = ones(n,1);
b = b*(1/(n^2));
b(1) = 0;
b(n) = 0;

[x] = Elimin_gauss_vec(full(M),b);

%% b)

t = linspace(0,1,n);

figure;
plot(t, x, 'b-o');%, 'LineWidth', 0.5);
xlabel('t');
ylabel('x(t)');
title('Solución del sistema: x(t) vs t');
grid on;
