#comp p2 preg 6
#ft=-cv-kx+F <== F=0
#ft=-cv-kx
#ma=-cv-kx ==> mx''=-cx'+-kx
#x''=(-c/m)x'+(-k/m)x
%cambio de variable:
%x1=x
%x1'=x'
%x2=x' ---> x1'=x2
%x2'=x''--> x2'=(-c/m)x2+(-k/m)x1
m=20;
k=20;
c=10;
f=@(t,x) [x(2) ; (-c/m)*x(2)+(-k/m)*x(1)];
x0=[1,0]; %<-parte del reposo a un metro hacia la derecha
T1=0;
T2=10;
L=1600;
[t,x]=rk4(f,[T1,T2],x0,L);
x(end,:);

plot(t,x(:,2))

max_i=1;
for i=2:L
  if (abs(x(i,2))>abs(x(max_i,2)))
    max_i=i;
  endif
endfor
x(max_i,2)
t(max_i)
