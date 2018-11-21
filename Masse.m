function [me1,me2,me3,M0]=Masse(x)
% Cette fonction calcule les masses d'ergols "mej" dans les etages et la
% masse totale du lanceur-satelitte au decollage.
% En entree: le vecteur x = (Mij/Mfj), j=1,2,3.

global mu k
me3=mu*(x(3)-1)/(1+k(3)-x(3)*k(3));
Mi3=(1+k(3))*me3+mu;
me2=Mi3*(x(2)-1)/(1+k(2)-x(2)*k(2));
Mi2=(1+k(2))*me2+Mi3;
me1=Mi2*(x(1)-1)/(1+k(1)-x(1)*k(1));
M0=(1+k(1))*me1+Mi2;
fprintf('me1= %f, me2= %f, me3= %f, M0= %f\n', me1, me2, me3, M0);
end
