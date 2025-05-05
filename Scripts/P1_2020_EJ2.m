f=@(x) x+(e.^(-10.*x.^2)).*cos(x);
df=@(x) 1-(e.^(-10.*x.^2)).*sin(x)+(e^(-10.*x.^2)).*cos(x).*(-20).*x.*(-10).*x.^2;

x=linspace(-1,1,10000);
plot(x,f(x));
grid on;
hold on;

x0=0;
tol=1e-6;
[x_nr,h_nr]=newton(f,df,x0,1000,tol);
disp(x_nr);
disp(length(h_nr));
