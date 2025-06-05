#ejercicio 4 guia 6
f1=@(x) sin(pi.*x);
f2=@(x) 1./(1+x.^2);
F1=@(x) -cos(pi.*x)/pi;
F2=@(x) atan(x);
I1=(F1(5)-F1(0))
I2=(F2(5)-F2(-5))
L=1;
E=zeros(12,3)

x1=linspace(0,5,201);
x2=linspace(-5,5,201);

for n=2:13
#inciso a)
E(n-1,:)= [n I1-intNCcompuesta(f1,0,5,L,n) I2-intNCcompuesta(f2,-5,5,L,n)];

#inciso b)
subplot(2,1,1),
xi1=linspace(0,5,n);
plot(x1,f1(x1),x1,polyval(polyfit(xi1,f1(xi1),n-1),x1))
grid on;grid minor

subplot(2,1,2),
xi2=linspace(-5,5,n);
plot(x2,f2(x2),x2,polyval(polyfit(xi2,f2(xi2),n-1),x2))
grid on;grid minor
pause(1)

endfor
E

#inciso c) no, no es cierto. contraejemplo: f2.
