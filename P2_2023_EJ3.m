#P2 2023 ej3
f=@(x) 2+cos(pi*x);
df=@(x) -pi*sin(pi*x);
I=@(x) 2*pi*f(x).*sqrt(1+df(x).^2);
a=0;
b=2;
n=3;
L=40;
S1=cuad_gauss_c(I,a,b,L,n)
S2=cuad_gauss_c(I,a,b,L*2,n)
#comparando ambas, S1 tiene 9 cifras exactas


