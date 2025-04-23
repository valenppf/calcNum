function[p,h]=biseccion(f,a,b,maxit,tol)
  tic();
  fa=f(a);
  fb=f(b);
  it=0;
  while (it<maxit)
    it++;
    p=(a+b)/2
    fp=f(p);
    h(it)=abs(fp);
    if h(it)<tol
      break
    endif
    if (sign(fp)*sign(fb)<0)
      fa=fp;
      a=p;
    else
      fb=fp;
      b=p;
    endif
  endwhile
  t=toc();
endfunction
