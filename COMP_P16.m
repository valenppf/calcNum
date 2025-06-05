#comp p2 preg 16
f=@(t,y) [y(2);-(9.81/2)*sin(y(1))];
T1=0;
T2=10;
L=100;
y0=[0,1];
[t,y]=rk4(f,[T1,T2],y0,L);
y(end,1)
[t,y]=rk4(f,[T1,T2],y0,L*2);
y(end,1)
[t,y]=rk4(f,[T1,T2],y0,L*4);
y(end,1)
[t,y]=rk4(f,[T1,T2],y0,L*8);
y(end,1)
