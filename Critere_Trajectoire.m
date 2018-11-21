function [V_tf] = Critere_Trajectoire(theta)
% Cette fonction definie le critere du probleme de trajectoire.
% Entree : 
% theta: vecteur des angles d'incidence 
% Sortie :
% V_tf : vitesse finale a maximiser

[~,~,Vf,~] = Simulateur(theta) ;
V_tf = norm(Vf) ;
end