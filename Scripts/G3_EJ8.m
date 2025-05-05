################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 3 ######################
################## EJERCICIO 8 ###################

Nh = 25; % Número de divisiones de la viga
wSOR = 1;
maxit = 50000;
tol = 1e-8;

L = 5; % Longitud
h = 1/Nh; % Tamaño del intervalo
P = 1.0326e4; % Carga
w = 0.07; % Espesor
s = 0.14; % Altura
E = 2.1e11; % Módulo de Young
J = (w*s^3)/12; % Momento de inercia
fj = (-P*L)/(E*J);

% Divisiones del dominio
x = linspace(0,L,Nh+1);

%% Se arma la matriz
[Afull,b,x0] = MatrizVigaBiEmpotrada(Nh,L,fj);


%% MÉTODO OCTAVE
##u = Afull\b;
##u = [0;0;u;0;0];
##
##%% MÉTODO DIRECTOS
##[Adoo,rdoo] = doolittle_p(Afull);
##n = length(Afull(:,1));
##P = eye(n)(rdoo,:);
##L = eye(n)+tril(Adoo(rdoo,1:n),-1);
##U = triu(Adoo(rdoo,1:n));
##Pb = P*b;
##L = [L Pb];
##y = sust_adel_vec(L);
##U = [U y];
##nuD = sust_atras_vec(U);
##nuD = [0;0;nuD;0;0];

%% MÉTODO GAUSS-SEIDEL
tic()
[nuGS,itGS,rGS] = gaussseidel(Afull,b,x0,maxit,tol);
tGS = toc();
nuGS=[0;0;nuGS;0;0];
disp('===================================================')
disp('Tiempo del método de Gauss-Seidel');
disp(tGS)
disp('Cantidad de iteraciones del método de Gauss-Seidel');
disp(itGS)

%% MÉTODO SOR
tic()
[nuSOR,itSOR,rSOR] = sor(Afull,b,x0,maxit,tol,wSOR);
tsor = toc();
nuSOR=[0;0;nuSOR;0;0];
disp('===================================================')
disp('Tiempo método SOR:');
disp(tsor)
disp('Iteraciones método SOR:');
disp(itSOR)


%% Graficamos las soluciones
##figure(1)
##plot(x,u,'r-*')
##grid on; hold on;
##plot(x,nuD,'b-s')
##title('Comparacion Solucion Octave vs Doolittle');
##legend('Método Octave','Doolittle');
##hold off

figure(2)
##plot(x,u,'r-*')
##grid on; hold on;
##plot(x,nuGS,'b-s')
##plot(x,nuSOR,'g-o')
##title('Comparacion Solucion Octave vs Met. Iterativos');
##legend('Método Octave','Gauss-Seidel','SOR');
##hold off;

# Convergencia
figure(3)
semilogy(rGS,'-r')
hold on;
semilogy(rSOR,'-b')
grid on;
title('Tasas de convergencia');
xlabel('iteraciones');
ylabel('residuos');
legend('Gauss-Seidel','SOR');

