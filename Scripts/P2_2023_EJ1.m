#parcial 2 2023 ej 1
x=[0.0:0.2:2.0]';
y=[4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94]';

f0=ones(length(x),1);
f1=cos((0.5).*pi.*x);
f2=((cos((0.5).*pi.*x)).^2);

M=[ f0 f1 f2 ];
MtM=M' * M
Mty=M' * y

a=MtM\Mty;
a0=a(1)
a1=a(2)
a2=a(3)

f=@(x) a0 + a1.*cos((0.5).*pi.*x) + a2.*((cos((0.5).*pi.*x)).^2);
er_ajuste=abs(f(1)-5.33) %<- diferencia entre el 'y' real y el dado por el ajuste
