close all; clear all; clc;
format long g;

%PVI
f = @(t,z) [z(2);20*cos(z(1))^2 - z(2) - sin(z(1))];
ang0 = pi/2;
v0 = 0;

a=0;
b=4.5;

%=====A=====
L=1;
[t,ang] = rk4(f,[a,b],[ang0,v0],L);
for i=1:100
  L = L*2;
  [t,ang1] = rk4(f,[a,b],[ang0,v0],L);
  if abs(ang1(end,1)-ang(end,1)) < 0.0001
    ang = ang1;
    break;
  endif
  ang = ang1;
endfor
ang

%En t=4.5 el angulo es
ang(end,1)
%y en ese momento el pendulo se esta moviendo de derecha a izquierda
ang(end,2)

%=====B=====
[t,ang] = rk4(f,[a,6],[ang0,v0],L);
figure(1);
%Durante los primeros 6 segundos, el péndulo cambio 5 veces de direccion
plot(t,ang(:,2))  %cada vez que la deriivada pasa por y=0, cambia de direccion

%=====C=====
tEstacionario = 10
[t,ang] = rk4(f,[a,tEstacionario],[ang0,v0],200);
for i=1:100
  tEstacionario = tEstacionario + 10;
  [t,ang1] = rk4(f,[a,tEstacionario],[ang0,v0],200);
  if abs(ang1(end,1) - ang(end,1)) < 0.0001;
    ang = ang1;
    break
  endif
  ang = ang1;
endfor
figure(2);
%El angulo al que tiende el pendulo con respecto a la vertical es mayor a 45 grados
ang(end,1)
plot(t,ang(:,1));
