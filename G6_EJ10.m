#ejercicio 10 guia 6
f=@(x) 20*x-(x.^3)./5;
df=@(x) 20-(3/5).*x.^2;
F=@(x) 2*pi*f(x).*sqrt(1+df(x).^2);
a=0;
b=2;
L=1;
n=3;
Q_g=cuad_gauss_c(F,a,b,L,n)
Q_s1=intNCcompuesta(F,a,b,L,3)


Q_t=intNCcompuesta(F,a,b,5,2)
Q_s=intNCcompuesta(F,a,b,5,3)
Q_q=quad(F,a,b)


