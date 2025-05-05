A=[1 1+0.5e-15 3;
2 2 20;
3 6 4];
[Adp,r]=doolittle_p(A);
disp('fact doolittle pivoteo:');
Adp
Lp=tril(Adp,-1)+eye(3);
Up=triu(Adp);
P=eye(size(A,1));
P=P(r,:);
disp('residuo matricial pivoteo:')
Rp=P*A-Lp*Up #diferencia numérica minúscula en (3,3), error de máquina esperable

[Ad]=doolittle(A);
disp('fact doolitle sin pivot:')
Ad
L=tril(Ad,-1)+eye(3);
U=triu(Ad);
disp('residuo matricial sin pivot:')
R=A-L*U #diferencia numérica muuuuy grande en (3,3), muestra lo catastrofico que puede ser factorizar sin pivoteo
