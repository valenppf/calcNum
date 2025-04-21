function [A,r]=doolittle_p(A)
  n=length(A(:,1));
  r=1:n;
  for k=1:n-1
    % la funcion max devuelve
    % pmax: el pivote de mayor valor absoluto
    % p: posicion donde se encuentra pmax (local)
    [pmax,p] = max(abs(A(r(k:n),k)));
    p = p(1)+k-1; %actualizamos pos. a numeracion global
    r([k p])= r([p k]); %actualiza el pivote
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n) = A(r(k+1:n),k+1:n)-A(r(k+1:n),k)*A(r(k),k+1:n);
  endfor
  A = A(r, :);
endfunction

