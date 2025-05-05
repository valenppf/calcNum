g=9.8;
ca=15;
t=5;
v=35;
fm=@(m) g.*m-g.*m.*(-exp(-(ca./m).*t))-ca*v;
%dfm=@(m) g-(g.*(1-exp(-(c./m).*t)+g.*m.*(-exp(-(c./m).*t)).*(-(c./m).*t).*(c*t)/(m.^2)));

%m=linspace(0,100,10000);
%plot(m,fm(m));
%hold on;
%grid on;

x0=45;
tol=1e-8;
[m_s,h_s]=secante(fm,40,50,1000,tol);
disp(m_s);
disp(length(h_s));

mb=110;
fc=@(c) g.*mb-g.*mb.*(-exp(-(c./mb).*t))-c*v;

c=linspace(0,50,10000);
plot(c,fc(c));
hold on;
grid on;

[c_s,h_s]=secante(fc,20,25,1000,tol);
disp(c_s);
disp(length(c_s));
