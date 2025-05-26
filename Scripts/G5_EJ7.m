#ejercicio 7 guia 5

#tenemos dos funciones del tiempo: la pos. en x y la pos en y.
#que parta del reposo en ambos casos significa que la vel. inicial es cero
#como las funciones x e y de t son de posición, su derivada da la velocidad
#basicamente da dos condiciones en la primera derivada: x'(0)=y'(0)=0 (primera
#condición), y al final de la trayectoria también es cero porque se detiene.
#en total el recorrido dura 1+1+1+1=4 segundos. por ende x'(4)=y'(4)=0 (segunda
#condición). con esto en mente armamos dos splines separados, uno para x de t,
#otro para y de t, y finalmente grafico y de x.
#también se detiene al alcanzar el punto 6,6
clear all;clf;

t1=[0 1 2];
t2=[2 3 4];
x1=[0 2 6];
x2=[6 3 0];
y1=[0 4 6];
y2=[6 2 0];
d0=0;
dn1=0;
dn2=0;

[Sx1,dSx1,ddSx1]=funcion_spline(t1,x1,d0,dn1);
[Sx2,dSx2,ddSx2]=funcion_spline(t2,x2,dn1,dn2);
[Sy1,dSy1,ddSy1]=funcion_spline(t1,y1,d0,dn1);
[Sy2,dSy2,ddSy2]=funcion_spline(t2,y2,dn1,dn2);
tt1=linspace(0,2,100);
tt2=linspace(2,4,100);
xt1=Sx1(tt1);
yt1=Sy1(tt1);
xt2=Sx2(tt2);
yt2=Sy2(tt2);
plot(tt1,xt1,'ko'); hold on;
plot(tt1,yt1,'m*');
plot(tt2,xt2,'ko');
plot(tt2,yt2,'m*');
