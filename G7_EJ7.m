#tp7 ej7
x0=[1 -1];
h=0.05;
f=@(t,x) ([-t*x(2) ; t*x(1)-t*x(2)]);
Ti=0;
Tf=20;
x0=[1;-1];

L=(Tf-Ti)/h;

[t,x]=euler(f,[Ti,Tf],x0,L)
##x es un 'vector' de dos columnas; la primera es la sol.x1 y la
##segunda la sol x2.
##t son los valores para los cuales la sol es x1 y x2 en esa
##posicion. buscar un valor de la sol. específico, ya sea
##alguno de los x o un t, se puede resolver de muchas formas
plot(x(:,1),x(:,2)); hold on;
