#comp p2 preg 9
#acá O es theta
#O''=-f(O)*O'-sen(O) , t>=0
%cambio de variable
%y1=O
%y2=O' ----> y1'=y2
%y2'=O'' --> y2'=-f(y1)*y2-sen(y1)

long=1;
alt=3/4;
O0=acos(alt/long);
f =@(t,y) [ y(2) ; (-0.8.*(abs(y(1))<O0).*y(2)-sin(y(1)))]
Ta=0;
Tb=5;
y0=[pi/2 0];
N=100;
[t,y]=rk4(f,[Ta,Tb],y0,N)
plot(t,y(:,1));grid on
y(end,1)
y(end,2) %<-vel positiva, se mueve de izq a derecha

%inciso b
%cambiar de direccion acá implica llegar a velocidad cero y reanudar
%su movimiento hacia la otra direccion
plot(t,y(:,2));grid on
hold on;
plot(t,zeros(length(t),1)); %<-veo gráficamente
%dónde es que la gráfica de la velocidad se hace cero

