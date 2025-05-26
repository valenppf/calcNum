#ejercicio 9 guia 5
x=[-1 0 1 2];
n=2; %<- el polinomio del exponente es de grado 2
y=[-1.1 -0.4 -0.9 -2.7];
#inciso a)
lny=log((-1).*y);
lnp=polyfit(x,lny,n);
#inciso b)
xx=linspace(-1.5,2.5,201);
lnP=polyval(lnp,xx);
P=(-1).*exp(lnP);
plot(xx,P); hold on;
plot(x,y,'c*')
