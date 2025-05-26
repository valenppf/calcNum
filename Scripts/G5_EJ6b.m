#ejercicio 6 b
x=[1 2 3];
y=[0 4 22/3];
df0=3;
dfn=3;
[S,dS,ddS]=funcion_spline(x,y,df0,dfn);
xx=linspace(1,3,201);
plot(xx,S(xx));
hold on;
plot(x,y,'ro','MarkerFaceColor','r');
[a b c d]=cubic_spline_clamped(x,y,df0,dfn);
a
b
c
d
