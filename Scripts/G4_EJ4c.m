f = @(x) sin(x) + cos(1 + x.^2) - 1;
df = @(x) cos(x) - 2*x.*sin(1 + x.^2);

fplot(f, [0,5])
grid on

tol=10^(-10);
maxit=50;

%biseccion
[p_bis,h_bis]=biseccion(f,0,5,maxit,tol);
disp(p_bis);
disp(length(h_bis));
#converge lento, pero siempre converge. tampoco necesita derivada. conviene cuando la tolerancia es alta


%newton-raphson
[p_nr,h_nr]=newton(f,df,2.5,maxit,tol);
disp(p_nr);
disp(length(h_nr));
#requiere derivada (que encima no sea pequeña ni cambie de signo) y depende mucho
#de la estimación inicail, pero converge muy rápido.

%secante
[p_sec,h_sec]=secante(f,2.4,2.6,maxit,tol);
disp(p_sec);
disp(length(h_nr));
#converge rápido, aunque no tanto como NR, y requiere dos aproximaciones,
#pero no requiere derivada.

