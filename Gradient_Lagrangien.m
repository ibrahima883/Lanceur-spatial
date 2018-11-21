function [GL]= Gradient_Lagrangien(x,lambda)
% Cette fonction effectue le calcul du gradient du lagrangien au point "(x,
% lambda)" et retourne la valeur calculee dans "GL".

global k Ve
y1=(1 + k(1))/x(1);
y2=(1 + k(2))/x(2);
y3=(1 + k(3))/x(3);
GL(1) =y2*y3*(1+k(1))/x(1)^2+ lambda*Ve(1)/x(1);
GL(2) =y1*y3*(1+k(2))/x(2)^2+ lambda*Ve(2)/x(2);
GL(3) =y1*y2*(1+k(3))/x(3)^2+ lambda*Ve(3)/x(3);
fprintf('GL= \n');
disp(GL);
fprintf('norm_GL = %f\n', norm(GL));
end
