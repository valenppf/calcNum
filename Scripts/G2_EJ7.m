tic
N=100;
h2=1/N^2;
dp=2*ones(N,1);
dl=-1*ones(N,1);
du=dl;

dp(1)=1;
dp(N)=1;
dl(N-1)=0;
du(2)=0;
A= spdiags([dl dp du],[-1 0 1],N,N);
full(A);

b=h2*ones(N,1);
b(1)=0;
b(N)=0;

x=gauss1(A,b)
toc

t=linspace(0,1,N);
plot(t,x,'b-','LineWidth',2);
xlabel('t');
ylabel('x(t)');
title('solucion');
grid on;

