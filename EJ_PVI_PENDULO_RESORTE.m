#problema examen pendulo
%m1x1''=-m1
%...
g=9.81;
l=15;
m1=1;
m2=3;
k=3;
x0=[0,0,-1,1];
Ti=0;
Tf=10;
f=@(t,z) [ z(3) ; z(4) ; (-(g/l)-(k/m1))*z(1)+(k/m1)*z(2) ; (k/m2)*z(1) + (-(g/l)-(k/m2))*z(2) ];
N=200;
[t,z]=rk4(f,[Ti,Tf],x0,N);
answer1=z(end,:)
[t,z]=rk4(f,[Ti,Tf],x0,N*2);
answer2=z(end,:)
[t,z]=rk4(f,[Ti,Tf],x0,N*4);
answer3=z(end,:)
[t,z]=rk4(f,[Ti,Tf],x0,N*8);
answer4=z(end,:)
disp('posicion del primer objeto a los 10s:');
answer4(1)
disp('posicion del segundo objeto:');
answer4(2)
disp('velocidad del primer objeto:');
answer4(3) %<-velocidad positiva significa que va de izquierda a derecha como indica el diagrama
disp('velocidad del segundo objeto:');
answer4(4) %<-velocidad negativa significa que va de derecha a izquierda



