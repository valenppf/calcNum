function [x,it,r_h] = gaussseidel(A,b,x0,maxit,tol)
  tic();
  n = length(b);
  x = x0; # debe inicializarse x
  it = 0;

  while (it < maxit)
    for i = 1:n
     x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    r_h(it+1) = norm(x-x0,'inf')/norm(x,'inf'); %Error relativo
##    r_h(it+1) = norm(A*x-b); #norm(x-x0); %Norma euclidiana
    if r_h(it+1) < tol
     break;
    endif
    x0 = x;
    it = it+1;
  endwhile
  t = toc()
 end
