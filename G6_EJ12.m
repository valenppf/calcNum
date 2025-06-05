#ejercicio 12 guia 6
u=@(r,th) (10+(r.^3).*cos(3*th)+(2*r.^2)*sin(2*th)).*r;
L=20;
theta=linspace(-pi,pi,L+1);
for i=1:L+1
  Q(i)=intNCcompuesta(@(r) u(r,theta(i)),0,1,L,3);
endfor
E=simpsoncomp(theta,Q)
