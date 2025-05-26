#pregunta 14 compilado

t1=[0 1 2]';
t2=[2 3 4]';
x1=[0 2 6]';
x2=[6 3 0]';
y1=[0 4 6]';
y2=[6 2 0]';
d0=0;
dn1=0;
dn2=0;

[Sx1,dSx1,ddSx1]=funcion_spline(t1,x1,d0,dn1);
[Sx2,dSx2,ddSx2]=funcion_spline(t2,x2,dn1,dn2);
[Sy1,dSy1,ddSy1]=funcion_spline(t1,y1,d0,dn1);
[Sy2,dSy2,ddSy2]=funcion_spline(t2,y2,dn1,dn2);
dSx1(1.5)
dSy1(1.5)

