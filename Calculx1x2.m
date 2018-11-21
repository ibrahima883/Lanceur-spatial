function [x1,x2] = Calculx1x2(x3)
% Cette fonction effectue le calcul des deux premières composantes a partir
% de la donnee de la troiseme composante afin d'obtenir apres les masses
% d'ergols du lanceur

global k Ve
omega1 = k(1)/(1+k(1));
omega2 = k(2)/(1+k(2));
omega3 = k(3)/(1+k(3));
x1 = (Ve(1)-Ve(3)*(1-omega3*x3))/omega1/Ve(1);
x2 = (Ve(2)-Ve(3)*(1-omega3*x3))/omega2/Ve(2);
fprintf('x1= %f, x2= %f\n', x1, x2);
end

