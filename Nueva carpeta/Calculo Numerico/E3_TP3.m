################ CÁLCULO NUMÉRICO ################
###################### 2025 ######################
###################### TP 3 ######################
################## EJERCICIO 3 ###################

A = [3/4 1/6; 1/4 1/4];
metodo = 'gs';

[rhoA] = RadioEspectral(A,metodo,[]);

if rhoA < 1
  disp('Se cumple el criterio de convergencia.');
else
  disp('No se cumple el criterio de convergencia.');
end
