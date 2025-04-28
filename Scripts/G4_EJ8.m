E=@(t) exp(-t).*((t+1/3).^3+1/3)-1.5;
fplot(E,[0,6]);
hold on
tol=1e-5;
[pa_biseccion,ha_biseccion]=biseccion(E,0,3,50,tol);
disp(pa_biseccion);
disp(length(ha_biseccion));

dE=@(t) -exp(-t).*((t+1/3).^3-3.*(t+1/3).^2+1/3);
fplot(dE,[0,6]);
hold on
[pa_newton,ha_newton]=newton(E,dE,1.5,50,tol);
disp(pa_newton);
disp(length(ha_newton));


[pb_biseccion,hb_biseccion]=biseccion(dE,0,3,50,tol);
disp(pb_biseccion);
disp(length(hb_biseccion));

d2E=@(t) exp(-t).*(3(t+1/3).^3-6.*(t+1/3).^2+6.*(t+1/3));
fplot(d2E,[0,6]);
hold on
[pb_newton,hb_newton]=newton(dE,d2E,1.5,50,tol);
disp(pb_newton);
disp(length(hb_newton));

[pc_biseccion,hc_biseccion]=biseccion(d2E,0,3,50,tol);
disp(pc_biseccion);
disp(length(hc_biseccion));
