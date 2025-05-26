#ejercicio 11 guia 5

n=5*60/12;
t=[0:12/60:5]'; %<-mido t en docenas de minutos
vi=[0.61255
    1.40101
    2.69013
    3.40985
    3.95361
    3.59041
    3.09119
    2.71147
    2.01397
    1.35229
    1.09930
    1.30715
    1.99290
    3.46081
    5.34487
    7.50176
    9.35324
   11.22945
   12.76212
   13.99448
   14.41532
   14.47064
   13.91045
   13.01681
   12.18537
   11.26826 ];

#inciso a)
#tenemos 4 funciones en la comb. lineal
f1=@(t) sin((2).*t);
f2=@(t) (t.^2);
f3=@(t) ((2).^(t));
f4=@(t) ones(n+1,1);

#armo M y Mtranspuesta
M=[ f1(t) f2(t) f3(t) f4(t) ];
#armo la matriz y vector solucion del sistema
MtM=M'*M;
Mtv=M'*vi;
#soluciono el sistema con un método directo de octave
c=MtM\Mtv

tt=[0:12/60:6];

v=@(t) c(1)*f1(t) + c(2)*f2(t) + c(3)*f3(t)+ c(4);
prediccion_v=v(tt(30))

plot(tt,v(tt),'k-*');
hold on;

#inciso b)
p=polyfit(t,vi,6);
P=polyval(p,tt);
plot(tt,P,'r-o');
prediccion_p6=polyval(p,tt(30))

#inciso c)
v_vt=v(t);
e_vt=mean((vi-v_vt).^2)
v_p6=polyval(p,t);
e_p6=mean((vi-v_p6).^2)
#a priori, basándome en estos errores cuadráticos, y en los graficos me parece que el
#ajuste más apropiado es sin duda la función v.

#inciso d)
#calcular la distancia es integrar la velocidad. asumo que la pos inicial es cero
dist=polyint(p);
dist_6hs=polyval(dist,6)
