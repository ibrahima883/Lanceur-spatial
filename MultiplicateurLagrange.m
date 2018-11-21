function [Lambda] = MultiplicateurLagrange(x)
% Cette fonction calcule le multiplicateur de Lagrange du probleme
% d'etagement

global k Ve
omega1 = k(1)/(1+k(1));
y1 = ((1+k(1)/x(1))-k(1));
y2 = ((1+k(2))/x(2))-k(2);
y3 = ((1+k(3))/x(3))-k(3);
Lambda = -y1*y2*y3/(Ve(1)*(1-omega1*x(1)));
fprintf('Lambda= %f\n', Lambda);
end