function [Mi1] = Critere_Etagement(me)
% Cette fonction prend en entrée les masses d'ergols "me" et renvoie en
% sortie  la masse totale du lanceur "Mi1"

global mu k
ms1=k(1)*me(1);
ms2=k(2)*me(2);
ms3=k(3)*me(3);
Mf3=mu+ms3;
Mi3=Mf3+me(3);
Mf2=Mi3+ms2;
Mi2=Mf2+me(2);
Mf1=Mi2+ms1;
Mi1= Mf1+me(1);  
end