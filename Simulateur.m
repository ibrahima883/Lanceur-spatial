 function [tf, Rf, Vf, Mf] = Simulateur(theta)
% Cette fonction permet de simuler la trajectoire du lanceur-satellite.
% Entrees :
% theta : le vecteur des angles d'incidence poussee-vitesse.
% Sorties :
% tf : le temps final d'atteinte de l'orbite ciblee.
% Rf : le vecteur position du lanceur au temps tf ;
% Vf : le vecteur vitesse du lanceur au temps tf ;
% Mf : masse finale du lanceur-satellite au temps tf.

global me mu Tj qj thetaj  Rt k Ve
alpha = [15 ; 10 ; 10] ;   
Mi = [mu ; mu ; mu] ; 
t = 0 ; 
R = [Rt ; 0] ; 
V =[100*cos(theta(1)); 100*sin(theta(1))]; 
M = mu ; 
for j = 1:3 ; M = M + (1 + k(j))*me(j) ; end 
for j=1:3    
    for p = j:3  ; Mi(j) = Mi(j) + (1 + k(p))*me(p) ; end
    Tj = alpha(j)*Mi(j) ; 
    qj = Tj/Ve(j) ;
    tcj = me(j)/qj ;
    options = odeset('RelTol', 1e-03, 'AbsTol', 1e-03 );
    thetaj= theta(j+1);
    [Temps, Sol] = ode45(@EDO_Mouvement, [t t+tcj], [R(1) R(2) V(1) V(2) M], options);
    t = t + tcj ;
    R = [Sol(end, 1) ; Sol(end, 2)]; 
    V = [Sol(end, 3) ; Sol(end, 4)];
    M = Sol(end, 5) - k(j)*me(j);
    figure(1)
    hold on
    plot(Temps, Sol(:,5))
    title('Evolution de la masse du lanceur-satelitte au cours du vol ')
    xlabel('Temps de vol en s')
    ylabel('Masse en Kg') 
    grid minor
    figure(2)
    hold on
    plot(Temps, sqrt(Sol(:,3).*Sol(:,3) + Sol(:,4).*Sol(:,4)))
    title('Evolution de la Vitesse au fil du mouvement') 
    xlabel('Temps de vol en s')
    ylabel('Vitesse en m/s')
    grid minor
    figure(3)
    hold on
    VThetaDeg = -30:1:30;
    VTheta = VThetaDeg *pi / 180;
    XTerre = Rt * cos(VTheta);
    YTerre =  Rt * sin(VTheta);
    plot( 1e-03*XTerre, 1e-03*YTerre, 'r', 1e-03*Sol(:,1), 1e-03*Sol(:,2), 'b')   
    xlabel('x Km')
    ylabel('y km')
    legend('Surface terrestre','Trajectoire du lanceur')
    axis equal
    grid minor
    figure(4)
    hold on
    plot(Temps, 1e-03*(sqrt(Sol(:,1).*Sol(:,1) + Sol(:,2).*Sol(:,2))-Rt))
    title('Altitude du lanceur en fonction du temps')
    xlabel('Temps de vol en s')
    ylabel('Altitude en km')
    grid minor
end
tf = t;
Rf = [Sol(end, 1) ; Sol(end, 2)];
Vf = [Sol(end, 3) ; Sol(end, 4)];
Mf = M;
fprintf('     Temps final tf= %f s, \t Masse finale Mf= %f kg\n', tf, Mf);
fprintf('     Position finale: Rfx = %f km, Rfy = %f km, \t Altitude H= %f km\n', 1e-03*Rf(1), 1e-03*Rf(2), 1e-03*(norm(Rf)-Rt));
fprintf('     Vitesse finale: Vfx = %f m/s, Vfy = %f m/s, |Vf| = %f m/s \n', Vf(1), Vf(2), norm(Vf));
end

