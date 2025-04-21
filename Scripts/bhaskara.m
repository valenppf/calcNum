function [x1,x2,tipo] = bhaskara(p)
  disc=p(2)^2-4*p(1)*p(3);
  x1=(-p(2)+sqrt(disc))/(2*p(1));
  x2=(-p(2)-sqrt(disc))/(2*p(1));
  if disc<0
    tipo='complejas';
  endif
  if disc>=0
    tipo='reales distintas';
  endif
  if disc==0
    tipo='reales iguales';
  endif
endfunction
