function [x,h] = puntofijo(g,x0,kmax,tol)
  tic();
  it=1;
  while it<=kmax
    x=g(x0);
    h(it)=abs(x-x0); #criterio de error absoluto
    #h(it)=abs(x-x0)/abs(x); #error relativo
    if h(it)<tol
      break;
    endif
    x0=x;
    it++;
  endwhile
  t=toc();
endfunction
