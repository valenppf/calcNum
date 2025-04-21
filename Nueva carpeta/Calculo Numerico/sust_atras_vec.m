function x = sust_atras_vec(A)
tic()
x = A(:,end); %Todas las filas de la última columna: necesario para que x sea vect columna
n = length(x);

x(n) = A(n,n+1)/A(n,n);
for i = n-1:-1:1
  s = A(i,n+1); % representa al termino de b en la fila i
  s = s - A(i,i+1:n)*x(i+1:n);
  x(i) = s/A(i,i);
 %   x(i) = (A(i,n+1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
endfor

toc()
end
