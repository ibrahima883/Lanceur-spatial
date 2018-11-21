function [C] = Contrainte_Trajectoire(theta)
% Cette fonction definie le vecteur des contraintes sous lesquelles nous
% allons maximiser la vitesse finale.
% Entree: 
% theta : vecteur des angles d'incidence.
% Sortie:
% C : les contraintes du probleme de trajectoire.

global Rt Hc
C = zeros(2,1);
[~,Rf,Vf,~] = Simulateur(theta) ;
Rc = Hc + Rt;
C(1) = norm(Rf) - Rc ;
C(2) = Rf(1)*Vf(1) + Rf(2)*Vf(2) ;
end