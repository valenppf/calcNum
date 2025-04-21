function [x,it,er] = sor(A,b,x0,maxit,tol,w)
  n = length(b);
  x = x0; # debe inicializarse x
  for k=1:maxit
    for i = 1:n
     x(i) = (1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)- A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    er(k) = norm(x-x0,'inf')/norm(x,'inf');
    if er(k) < tol
     break;
    endif
    x0 = x;
  endfor
  it=k;
endfunction
