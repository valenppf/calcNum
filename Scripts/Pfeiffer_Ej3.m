% es un sistema de cinco ecuaciones s(t) evaluadas en los cinco valores de
% t que ofrece la tabla
f1=440;
f2=660;
f3=1100;
f4=5;
f5=8;
t1=0;
t2=0.0025;
t3=0.005;
t4=0.0075;
t5=0.01;

%matriz
M=[sin(2*pi*f1*t1) sin(2*pi*f2*t1) sin(2*pi*f3*t1) cos(2*pi*f4*t1) sin(2*pi*f5*t1);
sin(2*pi*f1*t2) sin(2*pi*f2*t2) sin(2*pi*f3*t2) cos(2*pi*f4*t2) sin(2*pi*f5*t2);
sin(2*pi*f1*t3) sin(2*pi*f2*t3) sin(2*pi*f3*t3) cos(2*pi*f4*t3) sin(2*pi*f5*t3);
sin(2*pi*f1*t4) sin(2*pi*f2*t4) sin(2*pi*f3*t4) cos(2*pi*f4*t4) sin(2*pi*f5*t4);
sin(2*pi*f1*t5) sin(2*pi*f2*t5) sin(2*pi*f3*t5) cos(2*pi*f4*t5) sin(2*pi*f5*t5); ]
%vector solucion
s=[2.1004 4.3702 5.1745 -0.7222 0.9249]';

#inciso a)
%vector de soluciones a
[a,r]=gauss_p(M,s);
a
r
#inciso b)
n=length(s);
Mp=M(r,:)%matriz permutada;
sp=s(r,:)%vector solucion permutado;
x0=zeros(n,1);

tol3=1e-4;
[x_3sor,it_3sor,er_3sor]=sor(Mp,sp,x0,5000,tol3,1.01);
wmin=1.01;
itmin=it_3sor;
for j=2:99
  wcurrent=j.*0.01;
  [x_3sor,it_3sor,er_3sor]=sor(Mp,sp,x0,1000,tol3,wcurrent);
  if it_3sor<itmin
    itmin=it_3sor;
    wmin=wcurrent;
  endif
endfor
itmin
wmin

