function [E]=Equation_Etagement(x3)   
% Cette fonction permet de recuperer dans "E" la valeur de
% l'equation de la contrainte au point "x3"du probleme d'etagement 
% qui a ete reformule en vue d'une resolution analytique 
% par la methode de Newton

global k Ve Vp 

omega1 = k(1)/(1+k(1));
omega2 = k(2)/(1+k(2));
omega3 = k(3)/(1+k(3));
cond = (Ve(3)-Ve(1))/(omega3*Ve(3));
if ( x3 > cond)
    x1 = (1-(1-omega3*x3)*Ve(3)/Ve(1))/omega1;
    x2 = (1-(1-omega3*x3)*Ve(3)/Ve(2))/omega2;
    E = Ve(1)*log(x1)+Ve(2)*log(x2)+Ve(3)*log(x3)-Vp;
else 
    fprintf('la contrainte n est pas definie pour ce x3...\n') ;
end
end