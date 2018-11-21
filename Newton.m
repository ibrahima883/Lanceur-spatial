function [sol] = Newton(g,gprime,x0)
% Cette fonction calcule le minimum d'une fonction scalaire par la methode
% de Newton. En entree: la fonction "g" a minimiser, sa derivee "gprime" et
% le point de depart "x0" pour la recherche du minimum. Elle renvoie en
% sortie le minimum stocke dans "Sol".

k=0;
itermax=100;
eps=1.e-5;
x=x0;
while (k<itermax && abs(feval(g, x))>eps)
y=x-feval(g,x)/feval(gprime,x);
x=y;
k=k+1;
end
sol = x ;
if (k<itermax)
    fprintf('Au bout de %d iterations, Newton a converge au point x=\n',k);
    disp(sol);
else
    fprintf('on a pas converge, le nb d''iterations maximale est atteint %,\n',k)
end
end