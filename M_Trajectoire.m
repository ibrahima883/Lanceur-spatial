clear ;
close all;

% Resolution du probleme de trajectoire definie comme suit:
% Maximiser la vitesse finale Vf sous les contraintes d'égalités
% suivantes: Rf = Rc et <Rf,Vf> = 0

global h precision me Ve mu Hc k Rt niou
precision = digits(6);
Rt = 6378137;
niou=3.986*(10^14);
mu=2800; 
Ve = [2600 ; 3000 ; 4400] ; 
k = [0.10 ; 0.15 ; 0.20] ; 
Hc=210000 ; 
h=1e-6*ones(4,1);
me=[50135.8 ; 23656.7; 10287.6 ] ;
theta0 = (pi/180)*[0.01 ; -2 ; 7 ; 12.87];
thetamin =(pi/180)*[0.01; -2 ; -10; -10];
thetamax = (pi/180)*[0.01; -2; 10; 10];
SQP(@Critere_Trajectoire,@Contrainte_Trajectoire, theta0, 1e-02, 1e-02, 30, thetamax, thetamin, 10, 10000);
