function [C] = Contrainte_Etagement(me)
%Cette fonction prend en entree le vecteur des masse d'ergols des étages et
%rend en sortie la valeur de la contrainte évalué en "me".

global  Ve mu k Vp
ms1=k(1)*me(1);
ms2=k(2)*me(2);
ms3=k(3)*me(3);
Mf3=mu+ms3;
Mi3=Mf3+me(3);
Mf2=Mi3+ms2;
Mi2=Mf2+me(2);
Mf1=Mi2+ms1;
Mi1= Mf1+me(1);
DV1=Ve(1)*log(Mi1/Mf1);
DV2=Ve(2)*log(Mi2/Mf2);
DV3=Ve(3)*log(Mi3/Mf3);
C=DV1+DV2+DV3-Vp;
end