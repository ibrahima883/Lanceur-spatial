function [Gf, Gc] = Gradient(fonc,cont, x0)
% La fonction Gradient permet de recuperer respectivement dans Gf et Gc 
% les gradients respectifs des fonctions critere fonc et contraintes cont
% au point x0
global h NbAppel
x = x0;
n = length(x0);
f0 = feval(fonc,x0);
NbAppel= NbAppel+1;
c0 = feval(cont,x0);
m = length(c0);
Gf=zeros(n,1);
Gc=zeros(n,m);
for i=1:n
    x(i) = x0(i) + h(i);
    f = feval(fonc,x);
    NbAppel= NbAppel+1;
    Gf(i) = (f-f0)/h(i);
    c = feval(cont, x);
    for j = 1:m 
        Gc(i,j) = ( c(j) - c0(j) )/h(i);
    end
    x(i) = x0(i);   
end
end