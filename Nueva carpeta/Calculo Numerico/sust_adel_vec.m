function x = sust_adel_vec(A)
tic()
x = A(:,end); % necesario para x sea columna
n = length(x); % defino n pero como una variable local de este script

x(1) = A(1,n+1)/A(1,1);
for i=2:n
  x(i) = (A(i,n+1)-A(i,1:i-1)*x(1:i-1))/A(i,i);
%for i=2:n % aca vamos hacia adelante
%    s = A(i,n+1); % representa al termino de b en la fila i
%    s = s - A(i,1:i-1)*x(1:i-1);
%    x(i) = s/A(i,i);
%end
end

toc()
end
