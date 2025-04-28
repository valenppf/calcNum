a=0.401;
b=42.7e-6;
N=1000;
T=300;
p=3.5e+7;
k=1.3806503e-23;
tol=1e-12;
vol=@(V) (p+a.*(N./V).^2).*(V-N.*b)-k.*N.*T;
##vol=@(V) p.*V.^3-p.*N.*b.*V^2+a.*(N.^2).*V-a.*(N.^3).*b-k.*N.*T.*V.^2

fplot(vol,[0,0.1])
grid on

#biseccion:
[p_bis,h_bis]=biseccion(vol,0,1,100,tol);
disp(p_bis);
disp(length(h_bis));

#newton:
dvol=@(V) p-(a.*(N.^2)./V.^2)+2.*a.*N.^3.*b./V.^3;
[p_new,h_new]=newton(vol,dvol,p_bis,100,tol);
disp(p_new);
disp(length(h_new));
