function [x,h] = puntofijo(g,x0,kmax,tol)
  tic();
  it=0;
  while it<kmax
    x=g(x0);
    h(it+1)=abs(x-x0);
    if h(it+1)>tol
      break;
    endif
    x0=x;
    it++;
  endwhile
  t=toc();
endfunction
