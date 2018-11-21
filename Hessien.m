function [H] = Hessien(x, xp, GL, GLp, Hp, BFGS_ou_SR1)
% Fonction qui calcule une approximation du hessien d'une fonction en 
% un point "x" par la methode de quasi-Newton, ou "xp" est le point precedent de
% l'iteration et "Hp" la matrice hessienne (modifiee) de F a l'iteration
% precedente, et par defaut, a partir de la formule BFGS.
% Pour utiliser la formule SR1, on pourra passer l'argument d'entree
% "BFGS_ou_SR1" = 1.
d = x - xp ;
y = GL - GLp ;
if (BFGS_ou_SR1 == 1)
    if ((d')*(y - Hp*d) ~= 0)
        H = Hp + ((y - Hp*d)*(y - Hp*d)')/((d')*(y - Hp*d)) ; % SR1
    else
        H = Hp ;
    end
else     
    if ((y')*d > 0)
        H = Hp + ((y*y')/((y')*d)) - ((Hp*d*(d')*Hp)/((d')*Hp*d)) ; % BFGS
    else 
        H = Hp ;
    end
end
end