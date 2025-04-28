f=@(x) x.*log(x+3)-17.*x-1;
a=0;
b=1;
##f es cóncava hacia arriba, ergo el otro cero debe estar entre 0 y un punto b tal que f(b) sea positivo
while f(b)<0
  b=2*b;
endwhile
#disp(b);

format long

[p_bisec,h_bisec]=biseccion(f,a,b,10,1e2);
disp(p_bisec);

df=@(x) log(x+3)+x/(x+3)-17;
[p_newt,h_newt]=newton(f,df,p_bisec,50,1e-12);
disp(p_newt);
disp(length(h_newt));
