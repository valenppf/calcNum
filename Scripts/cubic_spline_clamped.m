##
##function [a,b,c,d] = cubic_spline_clamped(x,y,dy0,dyn)
### Pasamos un arreglo de puntos x e y
### Es una funcion para el calculo de una Spline Cubica sujeta, es decir con
### derivadas primeras dadas en los extremos (dy0 y dyn)
### programado en base a Burden y Faires Ed9 pag 155. Ojo tener cuidado el codigo
### en base 1 y el libro en base 0.
### S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(x-xj)^3 para xj <= x <= xj+1;
### S'(x1) = dy0  , S'(xn+1)=dyn
##
### cantidad de puntos
##n = length(x);
### medimos los h de cada una de las Splines por tramos
##h(1:n-1) = x(2:n)-x(1:n-1);
##
##v = zeros(n,1);
##
##v(1) = 3 * ( (y(2)-y(1) ) / h(1) - dy0 ); #paso 2
##v(2:n-1) = 3 * ( (y(3:n)-y(2:n-1) ) ./ h(2:n-1)...
## -( y(2:n-1) - y(1:n-2) ) ./ h(1:n-2));#paso3
###v(2:n-1) = 3 * ( ((y(3:n) - y(2:n-1)) ./ h(2:n-1)') ...
###              - ((y(2:n-1) - y(1:n-2)) ./ h(1:n-2)') );
##v(n) = 3*( dyn - ( y(n) - y(n-1) ) / h(n-1) ); # paso 2
##
### de aca en adelante resolvemos un sistema lineal tridiagonal utilizando un método
### que vimos en Métodos Directos, Crout optimizado para matrices tridiagonales.
### acordarse que tenemos base 1.
##
##l(1) = 2*h(1);
##u(1) = 0.5;
##z(1) = v(1) / l(1);
##
##for i = 2:n-1
##  l(i) = 2 * ( x(i+1)-x(i-1) ) - h(i-1) * u(i-1);
##  u(i) = h(i) / l(i);
##  z(i) = ( v(i) - h(i-1) * z(i-1) ) / l(i);
##endfor
##
##l(n) = h(n-1) * (2-u(n-1));
##z(n) = ( v(n) - h(n-1)*z(n-1) ) / l(n);
##c(n) = z(n);
##for i = n-1:-1:1
##  c(i) = z(i) - u(i) * c(i+1);
##  b(i) = ( y(i+1)-y(i) ) / h(i) - h(i) * ( c(i+1) + 2 * c(i) ) / 3;
##  d(i)=(c(i+1)-c(i))/(3*h(i));
##
##endfor
## a = y(1:n-1);
## b = b(1:n-1)';
## c = c(1:n-1)';
## d = d(1:n-1)';
##
##endfunction


function [a,b,c,d] = cubic_spline_clamped(x,y,ypa,ypb)
# OJO!tanto x como y lo paso como un arreglo filas:
# lo probamos con el trabajo practico guia 5


  # cantidad de puntos
  n = length(x);

  # inicializamos matriz A y vector lado derecho z
  A = zeros(n,n);
  z = zeros(n,1);

 # h(j) = x(j+1)-x(j)
  h = [x(2:n) - x(1:n-1)]'; # lo expresamos como vector columna

  # En Adown formo la diagonal inferior
  Adown=A;
  Asup=A;

  # diagonal principal dp
  dp = zeros(n,1);
  dp(2:n-1) = 2*(h(1:n-2) + h(2:n-1)); # puntos interiores
  dp(1) = 2*h(1); % primera fila
  dp(n) = 2*h(n-1); % ultima fila

  # diagonal Superior
  Asup(1:n-1,2:n) = diag(h(1:n-1));
  # diagonal Inferior
  Adown(2:n,1:n-1)= diag(h(1:n-1));

  # Armo la matriz A con los datos de arriba

  A = Asup + Adown + diag(dp);

  #A = diag([1,2*(h(1:n-2) + h(2:n-1)),1]) + diag([h(1:n-2),0],-1) + diag([0,h(2:n-1)],1);

  # Vector de términos independientes del sistema A*c = z, que calcula c
  # lo dividimos en partes separando las condiciones del contorno
  # puntos interiores
  z(2:n-1) = 3*[((y(3:n) - y(2:n-1))'./h(2:n-1) - (y(2:n-1) - y(1:n-2))'./h(1:n-2))];
  z(1) = 3*((y(2) - y(1))/h(1) - ypa);
  z(n) = 3*(ypb -(y(n) - y(n-1))/h(n-1));

  # Calculamos los coeficientes c
  % use el calculo con Octave, se deberia usar la función gauss programada
  % de metodos directos
  c=A\z;


  # Calculamos los coeficientes d
  d = (c(2:n) - c(1:n-1))./(3 * h(1:n-1));
  # Calculamos los coeficientes b
  # (y(2:n) - y(1:n-1))'  (falto poner ')
  b = ((y(2:n) - y(1:n-1))'./h(1:n-1)) - h(1:n-1).*(c(2:n) + 2*c(1:n-1))/3;
  # S(Xj) = f(Xj) = a(j)
  a = y(1:n-1)';
  # Defino c
  c = c(1:n-1);
