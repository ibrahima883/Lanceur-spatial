clear ;
close all;

% Recherche de la configuration optimale

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
theta =(pi/180)*[0.1 ; -1 ; -2.89 ; -2.1 ];
[thetaOptimal] = TrajectoireOptimale(theta, 1e-03, 3);