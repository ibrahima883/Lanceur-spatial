function [thetaOptimal] =TrajectoireOptimale(theta, epstheta, NbIterMax)
% Cette fonction permet de trouver la trajectoire optimale du lanceur
% Entrees:
% theta : point de depart pour la recherche
% epstheta : tolerance sur theta
% NbItermax : le nombre d iterations maximal autorise.

global me Vp Rt Hc niou
i=0; 
Vc=sqrt(niou/(Rt+Hc));
Vp=Vc;
deltaV=0.2*Vc;
while ( deltaV > epstheta && i<NbIterMax )
    Vp=Vp+deltaV;
    [me, ~, ~] = SQP(@CritereEtagement,@ContrainteEtagement, me, 1e-02, 1e-02, 50, 5*me, 0, 100, 100000);
    [thetaOptimal, ~, ~] = Routine_SQP(@CritereTrajectoire,@ContrainteTrajectoire, theta, 1e-03, 1e-03, 50, pi, -pi, 10, 10000);
    [tf, Rf, Vf, Mf] = Simulateur(thetaOptimal);
    Vr=norm(Vf);
    deltaV = Vc-Vr;
    i=i+1;
end
if (i < NbIterMax)
    fprintf('La trajectoire est optimale pour le theta suivant: %f\t %f\t %f\t %f\n', thetaOptimal);
    fprintf('   tf = %f, Mf= %f\n', tf, Mf);
    fprintf('   Altitude= %f, Vitesse finale= %f\n', norm(Rf)-Rt, Vr);
else
    fprintf('Le nombre maximal d''iterations a ete atteint:\n');
end
end