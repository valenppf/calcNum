#ejercicio 5 guia 6
nT=2;
nS=3;
#inciso a
fa=@(x) sin(pi.*x);
Fa=@(x) -cos(pi.*x)./pi;
Fa_def=Fa(5)-Fa(0);
e_1=zeros(12,4);
for i=1:12
  h=1/(2^i);
  L=(5-0)/h;
  EtrapL_a=abs(Fa_def-intNCcompuesta(fa,0,5,L,2));
  EsimpL_a=abs(Fa_def-intNCcompuesta(fa,0,5,L,3));
  if (i==1)
    razon_trap_a=0;
    razon_simp_a=0;
  else
    razon_trap_a=e_1(i-1,1)/EtrapL_a;
    razon_simp_a=e_1(i-1,3)/EsimpL_a;
  endif
  e_1(i,:)=[EtrapL_a razon_trap_a EsimpL_a razon_simp_a];
endfor
e_1

fb=@(x) (1)./(1+x.^2);
Fb=@(x) atan(x);
Fb_def=Fb(5)-Fb(-5);
e_2=zeros(12,4);
for i=1:12
  h=1/(2^i);
  L=(5-(-5))/h;
  EtrapL_b=abs(Fb_def-intNCcompuesta(fb,-5,5,L,2));
  EsimpL_b=abs(Fb_def-intNCcompuesta(fb,-5,5,L,3));
  if (i==1)
    razon_trap_b=0;
    razon_simp_b=0;
  else
    razon_trap_b=e_2(i-1,1)/EtrapL_b;
    razon_simp_b=e_2(i-1,3)/EsimpL_b;
  endif
  e_2(i,:)=[EtrapL_b razon_trap_b EsimpL_b razon_simp_b];
endfor
e_2

fc=@(x) abs(x).^(3/2);
Fc_def=10*(5^(1/2));
e_3=zeros(12,4);
for i=1:12
  h=1/(2^i);
  L=(5-0)/h;
  EtrapL_c=abs(Fc_def-intNCcompuesta(fc,0,5,L,2));
  EsimpL_c=abs(Fc_def-intNCcompuesta(fc,0,5,L,3));
  if (i==1)
    razon_trap_c=0;
    razon_simp_c=0;
  else
    razon_trap_c=e_3(i-1,1)/EtrapL_c;
    razon_simp_c=e_3(i-1,3)/EsimpL_c;
  endif
  e_3(i,:)=[EtrapL_c razon_trap_c EsimpL_c razon_simp_c];
endfor
e_3

##para la primera función, trapecio requiere 12 subintervalos para dar
##la solución real con 7 dígitos de precision, y simpson requiere 5.
##para la segunda función, trapecio requiere 8 subintervalos, mientras
##que simpson requiere tan solo 2.
##para la tercera función, trapecio requiere 10 subintervalos y
##simpson requiere 5.
