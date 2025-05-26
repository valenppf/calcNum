#ejercicio 5 guía 5
clear all;clc;clf;

x=linspace(-1,1,21);
xx=linspace(-1,1,201);% <-para graficar

#sin perturbacion
#f=sin(2.*pi.*x);

#con perturbacion:
perturbacion=1e-4;
f=sin(2.*pi.*x)+(-1).^[1:21]*perturbacion;

#p de lagrange (interpolacion exacta ya que n=20<cant. puntos)
p_coef=polyfit(x,f,20); %<-grado 20
p=polyval(p_coef,xx);

#spline
[S,dS,ddS]=funcion_spline(x,f);

#gráfico
figure(1)
#puntos en el gráfico
plot(x,f,'bo','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on;
#polinomio de lagrange
plot(xx,p,'g--','linewidth',3)
#spline cubica natural
plot(xx,S(xx),'k-','linewidth',3)
plot([-1,1],[0,0],'m-')
grid on
grid minor
xlabel('Datos X')
ylabel('Funcion (f(x))')
title('Métodos de interpolacion')

