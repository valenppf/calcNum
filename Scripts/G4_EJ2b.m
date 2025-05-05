f =@(x) x^3+4*x.^2-10;
g1=@(x) 0.5*sqrt(10-x.^3);
g2=@(x) sqrt(10./(4+x));
p0=1.5;
tol=1e-3;
[x_g1,h_g1] = puntofijo(g1,p0,100,tol);
disp(x_g1);
disp(length(h_g1));

[x_g2,h_g2] = puntofijo(g2,p0,100,tol);
disp(x_g2);
disp(length(h_g2));

%%%inciso c)
#sí, las cotas son válidas ya que cumplen con las condiciones que exije:
#son continuamente derivables en (1,2), y g(x) vale entre 1 y 2 (intervalo) para
#todo x.

#las cotas son: error<=(k^n)*max(p0-a,b-p0) , y error <=((k^n)/(1-k))*abs(p1-p0) para todo n>=1
#donde se supuso que existe k>=abs(g'(x)) y k<1
a=1;
b=1;
dg1=@(x) -(3/4)*x.^2./sqrt(10 - x.^3);
xs = linspace(a, b, 1000);
k1 = max(abs(dg1(xs)));

n=(1:length(h_g1))';
cota1_g1=k1.^n.*max(p0-a,b-p0);
cota2_g1=(k1.^n)./(1-k1)*abs(h_g1(1));
printf("Cota 1 (directa): %.10f\n", cota1_g1);
