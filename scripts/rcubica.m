function[x] = rcubica(a)
if a==0
  x=0;
  return;
endif
f=@(x)x.^3 - a;
if a>0
  izq=0;
  der=max(1,a);
else
  izq=min(-1,a);
  der=0;
endif

tol=1e-12
maxit=ceil(
