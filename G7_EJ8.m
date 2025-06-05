#tp7 ej 8
f=@(t,x) ([x(1)*(3-0.002*x(2));
          -x(2)*(0.5-0.0006*x(1))]);
Ti=0;
Tf=18;
h=0.05;
x0=[1600;800];
L=(Tf-Ti)/h;

[t,x]=rk4(f,[Ti,Tf],x0,L)
plot(t,x(:,2)); hold on;
plot(t,x(:,1));
