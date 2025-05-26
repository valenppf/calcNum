#pregunta 15 compilado

f=@(x) 1./(4.*x);
x=[1 2 3];
y=f(x);
p2=polyfit(x,y,2);
P2=polyval(p2,1.7);

#df=@(x) -1/(4.*x.^2);
#d2f=@(x) 2/(4.*x.^3);
d3f=@(x) -6/(4.*x.^4);
#el máximo de esta derivada tercera se da en x=1
#entonces el error teórico en x=1.7 es
E_teorico=(d3f(1)/(3*2*1)).*(1.7-1).*(1.7-2).*(1.7-3)%<- la productoria de (x-xi) hasta n=2

#el error real no es más que el valor de la funcion menos el valor
#del polinomio en x=1.7
E_real=abs(f(1.7)-P2)
