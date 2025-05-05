#4b
A=[10 5 0 0;
5 10 -4 0;
0 -4 8 -1;
0 0 -1 5];
b=[6 25 -11 -11]';
x0=zeros(4,1);
rho=radioEspectral(A,'sor',1.4);
[x_sor,it_sor,e_sor]=sor(A,b,x0,100,1e-5,1.01);
itmin=it_sor;
wmin=1.01;
for i=1:49
  w=1+i.*0.02;
  [x_sor,it_sor,e_sor]=sor(A,b,x0,100,1e-5,w);
  if it_sor<itmin
    itmin=it_sor;
    wmin=w;
  endif
endfor
itmin
wmin

[x_sor,it_sor,e_sor]=sor(A,b,x0,100,1e-5,1.10);
it_sor
x_sor
