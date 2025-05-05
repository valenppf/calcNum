P=@(x) 230.*x.^4+18.*x.^3+9.*x.^2-221.*x-9-x;%<-resto x para buscar el p fijo
x=linspace(-0.25,1,10000);
%miro la gráfica para tantear alrededor de dónde buscar los puntos
plot(x,P(x));
grid on;
format long;

tol=1e-9;
[x1_sec,h1_sec]=secante(P,-0.2,0,1000,tol);
x1_sec
length(h1_sec)

[x2_sec,h2_sec]=secante(P,0.9,1,1000,tol);
x2_sec
length(h2_sec)
