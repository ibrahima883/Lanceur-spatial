
function [dy] = EDO_Mouvement(t,y)
% Cette fonction permet de recuperer en sortie dans "dy" 
% les equations du mouvement du lanceur 

% Entrees :
% t : vaiable temporelle.
% y= [Rx; Ry; Vx; Vy; M] ou R = [Rx; Ry] est le vecteur position du lanceur
% V = (Vx, Vy) est le vecteur vitesse du lanceur, et
% M : la masse du lanceur-satellite 
% T = (Tx, Ty): vecteur trainee du lanceur 
% q : debit massique 
% theta: vecteur des angles d'incidence

global Tj qj thetaj Rt niou
dy=zeros(5,1);
dy(1) = y(3) ;
dy(2) = y(4) ; 
R = [y(1) ; y(2)] ;
r = norm(R); 
V = [y(3) ; y(4)] ;
v = norm(V) ;
gamma = asin(((R'*V)/(r*v))) ;
cx = 0.1 ;
rho0 = 1.225 ;
H = 7000;
rho = rho0*exp(-(r - Rt)/H) ;
er = (1/r)*[y(1) ; y(2)]; 
eh = (1/r)*[-y(2) ; y(1)];
U = cos(gamma+thetaj)*eh + sin(gamma+thetaj)*er ;
T = Tj*U ;
D = -cx*rho*v*V ;
W = -niou*(1/(r^3))*y(5)*R ;
dy(3) = (T(1) + W(1) + D(1))/y(5) ; 
dy(4) = (T(2) + W(2) + D(2))/y(5) ; 
dy(5) = -qj ; 
end
