clear ;
close all;

% Calcul du minimum du probleme d'optimisation: 
% (x,y) --> f(x,y) = x*x + y*y sous la contrainte
% (x,y) --> c(x,y)= x + y -1

global h precision
precision = digits(6);
h = 1e-03*ones(2,1);
x = [1;0];
NbIterMax=10;
epsGL=1e-04; epsx=1e-04;
borneSup=[3;3]; borneInf=[0;0];
rho=10; rhoMax=1000*rho;
SQP(@Critere_NormeAuCarre,@Contrainte_NormeAuCarre, x, epsGL, epsx, NbIterMax, borneSup, borneInf, rho, rhoMax);
