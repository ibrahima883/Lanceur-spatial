function [Sol, Lambda, NbIter, Nbfonc, Tab_Resultats] = SQP(fonc, cont, x, epsGL, epsx, NbIterMax, borneSup, borneInf, rho, rhoMax)
% Cette fonction permet de determiner le minimum d'une fonction f sous des contraintes d'egalite c.

% ########################## ENTREES ######################################
% fonc : R^n --> R est une fonction a minimiser.
% cont : R^n --> R^m  est le vecteur des contraintes.
% x designe le point courant. 
% epsGL: la tolerance sur la norme du gradient du lagrangien.
% epsx la tolerance acceptee sur la norme entre x et le point precedent xp.
% NbIterMax: le nombre maximal d'iterations autorisées.
% borneSup: la borne supérieure de l'intervalle dans lequel on recherche le minimum 
% borneInf: la borne inférieure de l'intervalle dans lequel on recherche le minimum
% rho: coefficient de penalisation.
% rhoMax: la borne superieure sur rho.

% ######################## SORTIES: ######################################
% Sol : minimum (local) trouve de la fonction minimisee.
% Lambda : multiplicateur de Lagrande associe a Sol.
% NbIter : nombre d'iterations fait durant la phase de traitement.
% Nbfonc : nombre total d'appels de la fonction F lors de l'algorithme SQP.
% Tab_Resultats: tableau contenant les resultats obtenus à chaque iterations. 

%% 
global precision NbAppel
format shortG
k = 0 ; NbAppel = 0 ; s = 1 ; 
BFGS_ou_SR1 = 0 ; n = length(x) ;
[Gf, Gc] = Gradient(fonc, cont, x);
H = eye(n) ; xp= x-5 ;
istop = 0 ; init_h = 3 ;
c = cont(x) ; m=length(c);
Tab_Resultats = zeros(NbIterMax,n+2*m+4);
[lambdaQP, dQP] = SolutionPbQuadratique(Gf, H, Gc', - c);
GL = Gf + Gc*lambdaQP ;
norm_GL = norm(GL); 
Tab_Resultats(1,1) = k;
Tab_Resultats(1,n+2)= NbAppel;
Tab_Resultats(1,n+m+3) = norm_GL;
Tab_Resultats(1,n+2*m+4) = fonc(x);
for j=2:(n+2*m+1)
    if j <= (n+1) ; Tab_Resultats(1,j) = x(j-1);
    elseif j <= (n+m+1) ; Tab_Resultats(1,j+1)= c(j-n-1) ;
    elseif j <= (n+2*m+1) ; Tab_Resultats(1,j+2)= lambdaQP(j-n-m-1) ; 
    end    
end
%% 
while (norm_GL > epsGL && k < NbIterMax  && norm(x-xp)> epsx  && istop ==0)
    [yp ,~] = Merite(fonc, cont, xp, rho, dQP);
    [y,DDy] = Merite(fonc, cont, x, rho, dQP);
    if (y >= yp)       
       if (DDy < 0)
           s = Armijo(fonc, cont, x, dQP, rho, borneSup, borneInf); 
           init_h = 0; 
       else
           if (init_h == 0)
                H = eye(n) ;
                init_h = 1;
           elseif (norm(rho) < norm(rhoMax))
               rho = 2*rho ;
           else 
               istop=1; 
           end
       end
   end
    k = k+1;
    xp = x ;
    x = xp + s*dQP ;
    x = min(x, borneSup);
    x = max(x, borneInf);
    Gfp = Gf;
    Gcp = Gc;  
    [Gf, Gc] = Gradient(fonc,cont, x) ;  
    c = cont(x) ;
    [lambdaQP, dQP] = SolutionPbQuadratique(Gf, H, Gc', -c);
    GLp=Gfp + Gcp*lambdaQP;
    GL = Gf + Gc*lambdaQP ;
    norm_GL = norm(GL);
    H = Hessien(x, xp, GL, GLp, H, BFGS_ou_SR1) ;
    H = ModifHessien(H);
    Tab_Resultats(k+1,1) = k;
    Tab_Resultats(k+1,n+2)= NbAppel;
    Tab_Resultats(k+1,n+m+3) = norm_GL;
    Tab_Resultats(k+1,n+2*m+4) = fonc(x);
    for j=2:(n+2*m+1)
        if j <= (n+1) ; Tab_Resultats(k+1,j) = x(j-1);
        elseif j <= (n+m+1) ; Tab_Resultats(k+1,j+1)= c(j-n-1) ;
        elseif j <= (n+2*m+1) ; Tab_Resultats(k+1,j+2)= lambdaQP(j-n-m-1) ; 
        end  
    end
end
%%
if (istop == 1)
    fprintf ('le programme s est arreter au bout de %d iterations car on a atteint ou depasse rhoMax', k);
elseif (k==NbIterMax)
   fprintf('le programme s est arreter car on a atteint le nombre maximal d iterations\n');
else
    Nbfonc= NbAppel ; NbIter = k ;
    %fprintf('Au bout de %d iterations, SQP a trouve la solution suivante:\n', k);
    Sol = vpa(x,precision) ;
    Lambda = vpa(lambdaQP,precision) ;
    disp('          Le tableau ci-dessous represente les resultats fournis par la methode SQP:');
    disp(Tab_Resultats(1:k+1,:));
    for j = 1:n
        figure(j)
        hold on
        plot(Tab_Resultats(1:k+1,1), Tab_Resultats(1:k+1,j+1)) ;
        title('Evolution de la j^{ieme} coordonnee du point ')
        xlabel('Iterations') 
        ylabel('x_j')  
        grid minor
    end
    for j = (n+1):(m+n)
        figure(j)
        hold on
        plot(Tab_Resultats(1:k+1,1), Tab_Resultats(1:k+1,j+2)) ;
        title('Courbe de la j^{ieme} contrainte')
        xlabel('Iterations') 
        ylabel('C_j(x_k) ')
        grid minor
    end
    figure(m+n+1)
    hold on
    plot(Tab_Resultats(1:k+1,1), Tab_Resultats(1:k+1,m+n+3)) ; 
    title('Evolution de la norme du gradient du lagrangien') 
    xlabel('Iterations') 
    ylabel('Norme GL') 
    grid minor
end
end
