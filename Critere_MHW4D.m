function [fonc] = Critere_MHW4D(x)
% Cette fonction définit le critère du problème MH4WD

fonc = (x(1)-1)^2 + (x(1)-x(2))^2 + ((x(2)-x(3))^3) + ((x(3)-x(4))^4) + ((x(4)-x(5))^4);
end