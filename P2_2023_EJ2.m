#ej2 p2 2023
L=120;
E=2.1e6;
I=4250;
P=3000;
#M=EIk
#
#k(x) = P * y'' /( (1+y'^2)^(3/2) * EI )
f=@(x,y) [ y(2) ; ((P/(E*I))*(L-x)*((1+y(2)^2)^(3/2))) ];
y0=[0,0];
Xi=0;
Xf=120; %<-x solo puede ser menor o igual a L
h=0.0125;
N=Xf/h;
[x,y]=rk4(f,[Xi,Xf],y0,N)
plot(x,y(:,1));grid on;
imax=1;
for i=2:N
  if y(i,1)>y(imax,1)
    imax=i;
  endif
endfor

for j=1:N
  if y(j,2)>0.0019
    break;
  endif
endfor
j
x(j)
