function [A] = doolittle(A)
  n = length(A(:,1));

  for k = 1:n-1
    for i = k+1:n
      s = A(i,k)/A(k,k);
      A(i,k) = s;
      for j = k+1:n
        A(i,j) = A(i,j)-s*A(k,j);
      endfor
    endfor
  %% VECTORIZADO
##    A(k+1:n,k) = A(k+1:n,k)/A(k,k); %Valor lambda: vector columna
##    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
  endfor

  ##L = eye(n)+tril(A,-1);
  ##U = triu(A);
  ##L = [L b]
  ##y = sust_adel_vec(L)
  ##U = [U y]
  ##x = sust_atras_vec(U)
end
