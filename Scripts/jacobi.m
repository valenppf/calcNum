function [x,it,er]=jacobi(A,b,x0,maxit,tol)
  n=length(b);
  x=x0;
  for k=1:maxit
    for i=1:n
      x(i)=(b(i)-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    er(k)=norm(x-x0,'inf')/norm(x,'inf');
    if er(k)<tol
      break;
    endif
    x0=x;
  endfor
  it=k;
endfunction
