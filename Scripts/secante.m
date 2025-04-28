function [x,h] = secante(f,xmin,xmax,kmax,tol)
  tic();
  it=0;
  q0=f(xmin);
  q1=f(xmax);
  while it<kmax
    x=xmax-q1*(xmax-xmin)/(q1-q0);
    h(it+1)=abs(x-xmax);
    if (h(it+1))<tol
      break;
    endif
    xmin=xmax;
    q0=q1;
    xmax=x;
    q1=f(x);
    it++;
  endwhile
  t=toc();
endfunction
