function [rhoA] = radioEspectral(A,metodo,w)
% descomponemos la matriz A para calcular la matriz de iteracion
  [L D U]=descMatriz(A);

   % Seleccionamos el método
  if strcmp(metodo, "ja")
    rhoA = max(abs(eig(-inv(D)*(L+U))));
##   rhoA = abs(eigs(-inv(D)*(L+U)),1);

  elseif strcmp(metodo, "gs")
    rhoA = max(abs(eig(-inv(D+L)*U)));
##      rhoA = abs(eigs(-inv(D+L)*(U)),1);

  elseif strcmp(metodo, "sor")
    rhoA = max(abs(eig(-inv(D+w*L)*((w-1)*D+w*U))));
##      rhoA = abs(eigs(-inv(D+w*L)*((w-1)*D+w*U)),1);

  else
    error("Método no reconocido. Usa 'ja', 'gs' o 'sor'.");
  endif
endfunction
