function [cont] = Contrainte_MHW4D(x)
% Cette fonction définit les contraintes du probleme MH4WD

cont=zeros(3,1);
cont(1) = x(1) + x(2)^2 + x(3)^2 -3*sqrt(2) - 2 ;
cont(2) = x(2) - x(3)^2 + x(4) - 2*sqrt(2) +2 ;
cont(3) = x(1) * x(5) -2 ;
end