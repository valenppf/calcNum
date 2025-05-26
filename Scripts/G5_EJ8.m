#ejercficio 8 guía 5
clear all; clf;
x=[0 1 2 3 4 5 6];
y=[432 599 1012 1909 2977 4190 5961];
n=length(x);
xx=linspace(0,6,201);

#inciso a) p de grado menor o igual a 6
p6=polyfit(x,y,6);
p6x=polyval(p6,xx);

#inciso b) p1 lineal
p1=polyfit(x,y,1);
p1x=polyval(p1,xx);

#inciso c) p2 cuadratico
p2=polyfit(x,y,2);
p2x=polyval(p2,xx);

#inciso d) grafica
plot(xx,p6x,'k-*'); hold on;
plot(xx,p1x,'m-o');
plot(xx,p2x,'c-x');
#error cuadrático:
#p6 tiene error cuadrático cero porque interpola exactamente los puntos
y_p6=polyval(p6,x);
y_p1=polyval(p1,x);
y_p2=polyval(p2,x);

er_p6=(sum((y-y_p6).^2))./n
er_p1=(sum((y-y_p1).^2))./n
er_p2=(sum((y-y_p2).^2))./n
#el que mejor aproxima diría que es, obviamente, el p6, ya que
#tiene un error casi igual a cero, mientras que el error de las
#otras aprox. está en los miles. Pero esto es solo dentro del
#intervalo, todavía me queda ver si arroja predicciones razonables

#inciso e) error a las 10 semanas
cant_10_p6=polyval(p6,10)
cant_10_p1=polyval(p1,10)
cant_10_p2=polyval(p2,10)
#ahora vemos que la predicción anterior resultó ser completamente
#errónea, ya que a las 10 semanas el polinomio de grado 6, que
#era el de menor error en el intervalo dado, arroja una cantidad
#de mosquitos NEGATIVA. así que no, ya no es el modelo más
#apropiado para realizar predicciones

#inciso f) error relativo
cant_real=14900;
er_10_p6=abs(cant_10_p6-cant_real)/abs(cant_real)
er_10_p1=abs(cant_10_p1-cant_real)/abs(cant_real)
er_10_p2=abs(cant_10_p2-cant_real)/abs(cant_real)
#en definitiva, el polinomio p6, a pesar de interpolar los valores
#de forma exacta, estuvo lejos de ser el mas apropiado para
#predecir el crecimiento de la población de mosquitos.
