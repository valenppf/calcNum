function [L D U] = descMatriz(A)
  L = tril(A,-1);
  U = triu(A,1);
  D = diag(diag(A));
end
