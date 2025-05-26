#ej slpine final 2020
f=@(x) log(x.^2+1)-exp(x./2).*cos(pi.*x);
df=@(x) 2.*x./(x.^2+1) - ((1/2).*exp(x/2) - exp(x/2)*sin(pi*x)*pi);
df1=df(-5);
dfn=df(6);
xi=linspace(-5,6,9)';
y=f(xi);

[S,dS,ddS]=funcion_spline(xi,y,df1,dfn);

#inciso a)
val_S=S(4.2);
val_f=f(4.2);
er=abs(val_f-val_S)


