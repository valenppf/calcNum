% EJERCICIO 5 - Polinomios en Octave

% Definir vector de coeficientes del polinomio
p = [2 3 5 7];  % Representa: 2x^3 + 3x^2 + 5x + 7

% (a) Mostrar el polinomio en forma simbólica
disp("a) Representación simbólica del polinomio:")
polyout(p, 'x');
disp(" ")

% (b) Evaluación del polinomio en un escalar y un vector
x_esc = 2;
valor_escalar = polyval(p, x_esc);
disp(["b) Evaluación en x = ", num2str(x_esc), ": ", num2str(valor_escalar)])

x_vec = [0 1 2];
valores_vector = polyval(p, x_vec);
disp("   Evaluación en x = [0 1 2]:")
disp(valores_vector)
disp(" ")

% (c) Cálculo de raíces del polinomio
disp("c) Raíces del polinomio:")
raices = roots(p);
disp(raices)

