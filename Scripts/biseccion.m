function[p,h]=biseccion(f,a,b,maxit,tol)
  tic();
  fa=f(a);
  fb=f(b);
  it=1;
  while (it<=maxit)
    e=(b-a)/2;
    p=a+e;
    fp=f(p);
    h(it)=abs(e); #criterio de error absoluto
    #h(it)=abs(e)/abs(p) #criterio de error relativo
    #h(it)=abs(fp); #criterio de error en la funcion
    if h(it)<tol
      break
    endif

    if (sign(fa)*sign(fp)>0)
      fa=fp;
      a=p;
    else
      fb=fp;
      b=p;
    endif
    it++;
  endwhile
  t=toc();
endfunction
