function x = sust_atras_vec(A)
  x=A(:,end);
  n=length(x);
  x(n)=b(n)/A(n,n);
  for i=n-1:-1:1
    s=A(i,n+1);
    s=s-A(i,i+1:n)*x(i+1:n)
    x(i)=(b(i)-sum(j=i+1,1,A(i,j))*x(i-1))/A(i,i);
  endfor


endfunction

