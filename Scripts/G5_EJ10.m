#ejercicio 10 guia 5
t=[4 8 12 16 20 24];
ct=[1590 1320 1000 900 650 560];
lnct=log(ct); #<-me da los valores de lnb + -kx.
#interpolo estos valores para obtener el polinomio lineal cuyos
#coeficientes son lnc y k. aplico exp() para obtener b
lnp=polyfit(t,lnct,1); #<-grado 1 porque es lineal
lnp
b=exp(lnp(2)); b
k=-lnp(1); k

#inciso b)
#t es las horas después de terminada la tormenta. Por lo tanto
#el inciso pide c(t) para t=0
f=@(x) b.*exp(-k.*x);
c_final=f(0); c_final

#inciso c)
#sea c=200, despejo t
t_200 = (-1/k).*log(200/b); t_200

