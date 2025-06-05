#comp p2 preg 8

f=@(x) 1+x+cos(x);
df=@(x) 1-sin(x);
I=@(x) 2*pi*f(x).*sqrt(1+df(x).^2);
a=0;b=4;
S=cuad_gauss_c(I,a,b,10,3)
S2=cuad_gauss_c(I,a,b,20,3)
abs(S-S2)
