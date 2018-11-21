function [s] = Armijo(fonc, cont, x0, d, rho, borneSup, borneInf)
% Cette fonction prend en entrée la fonction critère "fonc", la ou les
% contraintes "cont", le point courant de SQP "x0", la direction "d" 
% suivant laquelle on effectue une recherche linéaire du pas, les bornes 
% superieure et inferieure "borneSup" et "borneInf" de l'intervalle de 
% recherche du minimum et elle renvoie en sortie le pas "s"

c1 = 0.1 ;
s = 1 ;
itermax = 10 ;
iter = 0 ;
x = x0 + s*d ;
[y0, DDy0] = Merite(fonc, cont, x0, rho, d) ;
[y, ~] = Merite(fonc,cont, x, rho, d) ;
v=y-y0-c1*s*DDy0;
n=length(v); 
bool= min(v>=zeros(n,1));
while ( bool && iter < itermax )
    iter = iter + 1 ;
    s = s/2 ;
    x=x0+s*d;
    x=min(x,borneSup);
    x=max(x,borneInf);
    [y, ~] = Merite(fonc,cont, x, rho, d) ;
    v=y-y0-c1*s*DDy0;
    bool= min(v>=zeros(n,1));
end
end