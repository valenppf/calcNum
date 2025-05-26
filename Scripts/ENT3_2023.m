#entregable 3 2023
tx=[0:2:6]
ty=[0:6]
tt=linspace(0,6,600);
x=[2.0 1.5 0.5 0.0]
y=[0.0 1.0 0.0 -1.0 0.0 1.0 0.0]
dy0=pi/2;
dyn=-dy0;
dx0=0;
dxn=0;

[Sy, dSy, ddSy]=funcion_spline(ty,y,dy0,dyn);
[Sx, dSx, ddSx]=funcion_spline(tx,x,dx0,dxn);
#plot(tty,Sy(tty))
#hold on
#plot(ttxy,dSy(tty))
#plot(ttx,Sx(ttx))
#hold on
#plot(ttx,dSx(ttx))
plot(Sx(tt),Sy(tt));

pos_3s_x=Sx(3)
pos_3s_y=Sy(3)
vel_3s_x=dSx(3)
vel_3s_y=dSy(3)

