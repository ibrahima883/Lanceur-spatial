function [DE]=DeriveeEquation_Etagement(x3)
% Cette fonction permet de calculer la derivee de l'equation de la
% contrainte du probleme d'etagement pour le calcul des masses d'ergols par
% l'approche analytique

global k Ve
omega3=k(3)/(1+k(3));
cond=(Ve(3)-Ve(1))/(omega3*Ve(3));
if (x3 > cond)
    DE =(Ve(1)*Ve(3)*omega3)/(Ve(1)-Ve(3)*(1-omega3*x3))+(Ve(2)*Ve(3)*omega3)/(Ve(2)-Ve(3)*(1-omega3*x3))+Ve(3)/x3;
else 
    fprintf('La derivee de la contrainte n est pas definie pour ce x3...\n') ;
end
end