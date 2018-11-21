clear ;
close all;

% Calcul analytique de la solution du probleme d'etagement 
% par la methode de Newton

global Ve mu Hc k Vp Rt niou
mu=2800; % masse utile du satelitte
Ve = [2600 ; 3000 ; 4400] ; % Vecteur des vitesses d'ejection 
k = [0.10 ; 0.15 ; 0.20] ; % Vecteurs des indices constructifs
Hc=210000 ; % Altitude ciblee
Rt=6378137;
niou=3.986*(10^14);
Vp=1.2*sqrt(niou/(Rt+Hc));
[sol] = Newton(@Equation_Etagement, @DeriveeEquation_Etagement, 4);
[x1,x2]=Calculx1x2(sol) ; % pour trouver x1,x2
x=[x1;x2;sol];
[me1,me2,me3,M0]=Masse(x) ; % Masse d'ergols
Lambda = MultiplicateurLagrange(x) ;
GL = Gradient_Lagrangien(x, Lambda); % verification de KKT: GL(x*,lambda*)=0
E = Equation_Etagement(sol);
disp(vpa(E,6));