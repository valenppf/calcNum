function [x] = Elimin_gauss_vec(A,b)
n = length(b);
%% No genero la matriz aumentada sino que trabajo A y b
%% por separado

for k = 1:n % Representa la diagonal donde estan los pivotes
  m = A(k+1:n,k)/A(k,k); %m = a(i,k)/a(k,k)
  A(k+1:n,k:n) = A(k+1:n,k:n)-m*A(k,k:n); %a(i,k)=a(i,k)-m*a(k,k)
  b(k+1:n) = b(k+1:n)-m*b(k); %b_i=b_i-m*b_k
endfor

A = [A b];
[x] = sust_atras_vec(A);
end
