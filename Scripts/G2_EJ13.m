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
A1= spdiags([dl dp du],[-1 0 1],N,N);
full(A);

b=h2*ones(N,1);
b(1)=0;
b(N)=0;
disp('inciso a):');
LU1=doolittle(A1)

disp('inciso b):');
for k=1:10
N=100;
h2=1/N^k;
dp=2*ones(N,1);
dl=-1*ones(N,1);
du=dl;

dp(1)=1;
dp(N)=1;
dl(N-1)=0;
du(2)=0;
Ak=spdiags([dl dp du],[-1 0 1],N,N);
full(Ak);

bk=h2*ones(N,1);
bk(1)=0;
bk(N)=0;

x=gauss1(Ak,b);
disp(k);
disp(max(x));

endfor
