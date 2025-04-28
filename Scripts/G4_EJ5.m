tol=10^(-4);
#minimizo el cuadrado de la funcion de distancia euclidea (sqrt( (x1-x2)^2 + (y1-y2)^2 ) )^2
#donde x2=1, y2=0, x1=x, y1=x^2
#f = @(x) (x-1).^2+x.^4 ;
f = @(x) x.^2-2.*x+1+x.^4;
#para obtener el mínimo hallo el cero de la derivada
df =@(x) 2.*x-2+4.*x.^3;
#como la función a la cual le quiero hallar un cero con newton-raphson es df, calculo la derivada segunda:
d2f=@(x) 2+12.*x.^2

#y meto todo en la funcion:
[x,h]=newton(df,d2f,0.5,50,tol);
disp(x);
disp(length(h));
