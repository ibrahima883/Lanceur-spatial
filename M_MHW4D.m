clear ;
close all;

% Calcul du minimum du probleme d'optimisation (MHW4D): 
% f(x1, ..., x5) = (x1-1)^2 + (x1-x2)^2 + (x2-x3)^3 + (x3-x4)^4 + (x4-x5)^4
% sous les contraintes suivantes:
% c1(x1, ..., x5) = x1 + x2*x2 + x3*x3 - 3*sqrt(2) - 2 = 0
% c2(x1, ..., x5) = x2 - x3*x3 + x4 - 2*sqrt(2) + 2 = 0
% c2(x1, ..., x5) = x1*x5 - 2 = 0

global h precision
precision = digits(6);
h = 1e-03*ones(5,1);  x0 = [-1;2;1;-2;-2];
NbIterMax=100;  epsGL=1e-04;   epsx=1e-04;
borneSup=[0;3;2;0;0];   borneInf=[-2;1;0;-3;-3];
rho=[10;10;10];   rhoMax=1000*rho;
SQP(@Critere_MHW4D,@Contrainte_MHW4D, x0, epsGL, epsx, NbIterMax, borneSup, borneInf, rho, rhoMax);
