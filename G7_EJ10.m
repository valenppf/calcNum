#tp7 ej10
#
f=@(t,y) [y(2);-sin(y(1))];
T1=0;
T2=20;
h=0.025;
L=T2/h;

%----a
y0a=[0.1,0];
[ta,ya]=rk4(f,[T1,T2],y0a,L);
figure(1);
plot(ta,ya(:,1));
hold on
%----b
y0b=[0.7,0];
[~,yb]=rk4(f,[T1,T2],y0b,L);
plot(ta,yb(:,1));
%----c
y0c=[3.0,0];
[~,yc]=rk4(f,[T1,T2],y0c,L);
plot(ta,yc(:,1));
%----d
y0d=[3.5,0];
[~,yd]=rk4(f,[T1,T2],y0d,L);
plot(ta,yd(:,1));
%----e
figure(2)
y0e=[0,1];
[te,ye]=rk4(f,[T1,T2],y0e,L);
plot(te,ye(:,1)); hold on;
%----f
y0f=[0,1.99];
[~,yf]=rk4(f,[T1,T2],y0f,L);
plot(te,yf(:,1));
%----g
y0g=[0,2];
[~,yg]=rk4(f,[T1,T2],y0g,L);
plot(te,yg(:,1));
%----h
y0h=[0,2.01];
[~,yh]=rk4(f,[T1,T2],y0h,L);
plot(te,yh(:,1));
%----
