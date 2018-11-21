function [HM] = ModifHessien(H)
% Fonction qui, a une matrice d'entree H, renvoie HM = H + tau*In matrice H
% modifiee telle que HM soit definie positive, pour tau assez grand.
vp = eig(H) ; 
vpmin = min(vp) ; 
HM = H ;
if (vpmin <= 0)
    tau = -vpmin + 0.1 ;
    n = length(H(1,:)) ;
    v = zeros(1,n) ;
    for j = 1:n
        v(j) = tau ;
    end
    D = diag(v) ;
    HM = H + D ;
end
end