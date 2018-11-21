function [y, DDy] = Merite(fonc, cont, x, rho, d)
% y: la valeur de la fonction merite en x
% DDy: la derivee derictionnelle de la fonction merite en x
global NbAppel
c=cont(x);
y = fonc(x) + rho*(norm(c,1)) ;
NbAppel= NbAppel+1;
[Gf, ~] = Gradient(fonc, cont, x) ;
DDy = (Gf')*d - rho*norm(c, 1) ;
end

