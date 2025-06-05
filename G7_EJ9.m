#tp7 ej9
##y=z1
##y'=z2 -> z1'=z2
##y''=z3 -> z2'=z3
##y''' -> z3'=f(t,z1,z2,z3)=-4z3-5z2-2z1-4sent-2cost

f=@(t,z) ([z(2);z(3); -4*z(3)-5*z(2)-2*z(1)-4*sin(t)-2*cos(t)]);

Ti=0;
Tf=2.5;
z0=[1;0;-1];
h=0.025;
L=(Tf)/h;
[t,z]=rk4(f,[Ti,Tf],z0,L);
#plot(t,z(:,1));
z(length(t),1)

Tic=0;
Tfc=15;
Lc=(Tfc)/h;
[tc,zc]=rk4(f,[Tic,Tf0],z0,Lc)
plot(tc,zc(:,2));


