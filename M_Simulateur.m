clear ;
close all;

% Simulation de la trajectoire

global h me Ve mu Hc k Rt niou
Rt = 6378137;
niou = 3.986*(10^14);
mu = 2800; 
Ve = [2600 ; 3000 ; 4400] ; 
k = [0.10 ; 0.15 ; 0.20] ;
Hc = 210000 ; 
h = 1e-6*ones(4,1);
me = [50135.8 ; 23656.7; 10287.6 ] ;
theta0 = (pi/180)*[0.01 ; -2.0 ; 7 ; 12.87];
[tf, Rf, Vf, Mf] = Simulateur(theta0);
