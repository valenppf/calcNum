f=@(x) x.^4+2.*x.^2-x-3;
g1=@(x) (3+x+2.*x.^2).^(1/4);
g2=@(x) ((x+3-x.^4)/2).^(1/2);
g3=@(x) ((x+3)/(x.^2+2)).^(1/3);
g4=@(x) (3.*x.^4+2.*x.^2+3)/(4.*x.^3+4.*x-1);

p0=1;
[x_g1,h_g1] = puntofijo(g1,p0,100,1e-6);
disp(x_g1);
disp(length(h_g1));

[x_g2,h_g2] = puntofijo(g2,p0,100,1e-6);
disp(x_g2);
disp(length(h_g2));

[x_g3,h_g3] = puntofijo(g3,p0,100,1e-6);
disp(x_g3);
disp(length(h_g3));

[x_g4,h_g4] = puntofijo(g4,p0,100,1e-6);
disp(x_g4);
disp(length(h_g4));

