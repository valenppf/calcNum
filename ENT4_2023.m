#entregable 4 2023
#x''=-gR^2 / (x+R).^2
%x1=x
%x2=x'
%el sistema queda tal que asi
%x1'=x2
%x2'= -gR^2/(x1+R)^2
g=9.81;
R=6373002;
f=@(t,x) [x(2); -((g.*(R.^2))./((x(1).^2+2*x(1)*R+R^2)))];
Ti=0;
Tf=180;
v0=1409.34;
x0=[0,v0];
L=7200;
[t,x]=rk4(f,[Ti,Tf],x0,L);
#plot(t,x(:,2)); hold on
#plot(t,zeros(length(t),1));
imax=1;
for i=2:L
  if x(i,1)>x(imax,1)
    imax=i;
  endif
endfor
x(imax,1)
t(imax)
