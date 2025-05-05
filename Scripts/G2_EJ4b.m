A1=[ 1 -1 2 -1;
0 2 -1 1;
0 0 -1 -1;
0 0 0 2];
A2=A1';
b=[-8 6 -4 4]';

x1=sust_atras(A1,b)
x2=sust_atras(A2,b)

%%conteo de operaciones
#para cada xi de sust_atras x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i),
#primero, A(i,i+1:n)*x(i+1:n) representa un prod. punto entre los
#coeficientes de la fila y las incógnitas ya calculadas.
#este producto interno involucra n-i multiplicaciones y n-i-1 sumas.
#esto se repite en cada fila i de 1 a n de la matriz nxn.
#finalmente, a este prod. interno se le añade la resta con b y la
#division por Aii.
#el toal de multiplicaciones y sumas es ((n-1)*n)/2.
#a esto se le añade n restas y n divisiones, pero no afectan a la
#complejidad algorítmica final que es de O(n^2).

#exactamente el mismo análisis vale para sustitución hacia adelante, ya que se
#hacen la misma cantidad de operaciones solo que de arriba hacia abajo.
