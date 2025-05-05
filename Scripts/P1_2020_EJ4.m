f=@(x) sin(x)+cos(1+x.^2)-1;
df=@(x) cos(x)-sin(1+x.^2).*x.*2;

x=linspace(0,10,15000);
plot(x,f(x));
grid on;
hold on;

x0=1;
tol=1e-6;

[x_n,h_n]=newton(f,df,x0,1000,tol);
disp(x_n);
disp(length(h_n));
