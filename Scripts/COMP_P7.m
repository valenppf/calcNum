#pregunta 7 compilado
format long;
clear all;

#inciso a)
x=(1:0.2:2.4);
y=[0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];
lny=log(y);
lnp=polyfit(x,lny,1);% <- grado 1 porque lny da un polinomio lineal
a=exp(lnp(2))
b=lnp(1)
f=@(x) a.*exp(b.*x);
valor=f(1.9)
