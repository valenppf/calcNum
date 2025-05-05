b=[1 2 3]';
A1=[8 4 1;2 6 2;2 4 8];
A2=[5.00e-2 5.57e+2 -4.00e-2;1.98e+00 1.94e+02 -3.00e-3;2.74e+02 3.11e+00 7.50e-002];
A3=[1 2 -1;2 4 0; 0 1 -1];
n=size(A1,1);

disp('fact. sin pivoteo:');
LU1=doolittle(A1);
L1=tril(LU1,-1)+eye(n);
U1=triu(LU1);
LU2=doolittle(A2);
L2=tril(LU2,-1)+eye(n);
U2=triu(LU2);
LU3=doolittle(A3);
L3=tril(LU3,-1)+eye(n);
U3=triu(LU3);

y1=sust_adelante(L1,b);
x1=sust_atras(U1,y1)
y2=sust_adelante(L2,b);
x2=sust_atras(U2,y2)
y3=sust_adelante(L3,b);
x3=sust_atras(U3,y3)

res1=A1-L1*U1
res2=A2-L2*U2
res3=A3-L3*U3

disp('fact. CON pivoteo (parcial):')
[LUp1,r1]=doolittle_p(A1);
P1=eye(n);
P1=P1(r1,:);
Lp1=tril(LUp1,-1)+eye(n);
Up1=triu(LUp1);
bp1=b(r1);

[LUp2,r2]=doolittle_p(A2);
P2=eye(n);
P2=P2(r2,:);
Lp2=tril(LUp2,-1)+eye(n);
Up2=triu(LUp2);
bp2=b(r2);

[LUp3,r3]=doolittle_p(A3);
P3=eye(n);
P3=P3(r3,:);
Lp3=tril(LUp3,-1)+eye(n);
Up3=triu(LUp3);
bp3=b(r3);

yp1=sust_adelante(Lp1,bp1);
xp1=sust_atras(Up1,yp1)
yp2=sust_adelante(Lp2,bp2);
xp2=sust_atras(Up2,yp2)
yp3=sust_adelante(Lp3,bp3);
xp3=sust_atras(Up3,yp3)

resp1=P1*A1-Lp1*Up1
resp2=P2*A2-Lp2*Up2
resp3=P3*A3-Lp3*Up3
