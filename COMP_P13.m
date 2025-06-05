#comp p2 preg 13
f=@(x) 2+cos(x)-sin(3*x);
df=@(x) -sin(x)-3*cos(3*x);
I=@(x) 2*pi*f(x).*sqrt(1+df(x).^2);
S1=cuad_gauss_c(I,0,3,30,3)
S2=cuad_gauss_c(I,0,3,60,3)
