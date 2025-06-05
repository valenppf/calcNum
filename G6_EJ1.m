#ej 1 guia 6
f=@(x) exp(x)-2*x.^2+3.*x-1;
df=@(x) exp(x)-4*x+3;
ddf=@(x) exp(x)-4;
x0=0.0;

#inciso a)
h=linspace(1e-11,1e-1,51);
e2=zeros(51,1);
for i=1:51
  df_2p=(f(x0+h(i))-f(x0))./h(i);
  e2(i)=abs(df(x0)-df_2p);
endfor
e2;
plot(h,e2); hold on;

#conclusiones: evidentemente, entre menor sea h, más chico es el error en la
#aproximación de la derivada

#inciso b)
x_vals=linspace(-0.1,0.1,500);
if abs(df(x0)-(f(x0+h(i))-f(x0))./h(i))<=norm(ddf(x_vals),'inf')*(h(i)/2)
  disp('true')
endif
#se verifica.

#inciso c)
e3=zeros(51,1);
for i=1:51
  df_3p=(f(x0+h(i))-f(x0-h(i)))./(2*h(i));
  e3(i)=abs(df(x0)-df_3p);
endfor
e3;
plot(h,e3);

#conclusiones: el error crece mucho más lento a mayor h que para
#2 puntos. además, pareciera que crece cuadráticamente (en forma
#de parábola
