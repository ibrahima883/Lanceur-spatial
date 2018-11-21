clear ;
close all;

% Resolution du probleme d etagement definie comme suit:
% Maximiser la fonction: R^3 --> R , me --> mu/M0 
% sous la contrainte d'acrroissement de vitesse:
% V = Ve1*log(Mi1/Mf1) + Ve2*log(Mi2/Mf2) + Ve3*log(Mi3/Mf3)
% Pour plus de details se reporter au document "Projet lanceur" 

global h precision Ve mu Hc k Vp Rt niou
precision = digits(6);
h = ones(3,1);
mu=2800; 
Ve = [2600 ; 3000 ; 4400] ; 
k = [0.10 ; 0.15 ; 0.20] ;
Hc=210000 ; Rt=6378137;
me0 = [125000;60000;25000];
niou=3.986*(10^14);
Vp=1.2*sqrt(niou/(Rt+Hc));
SQP(@Critere_Etagement,@Contrainte_Etagement, me0, 1e-04, 1e-03, 50, 5*me0, 0, 100, 100000);
