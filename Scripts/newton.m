function [x,h] = newton(f,df,x0,kmax,tol)
  tic();
  it=1;
  while it<=kmax
    x=x0-(f(x0)/df(x0));
    #h(it)=abs(x-x0); #criterio de error absoluto
    h(it)=abs(x-x0)/abs(x); #error relativo
    #h(it)=abs(f(x)); #error en la función
    if (h(it))<tol
      break;
    endif
    x0=x;
    it++;
  endwhile
  t=toc();
endfunction
