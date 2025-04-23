a=randi([1,10],1000,1);
b=randi([1,10],1000,1);
n_a=length(a);
n_b=length(b);
%version suboptima
tic
suma=0;
for i=1:n_a
  for j=1:n_b
    suma+=a(i)*b(j);
  endfor
endfor
disp(suma)
toc

%version reagrupada
tic
suma_a=0;
for i=1:n_a
  suma_a+=a(i);
endfor
suma_b=0;
for j=1:n_b
  suma_b+=b(j);
endfor
suma_tot=suma_a*suma_b
toc
