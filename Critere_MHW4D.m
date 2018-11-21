function [fonc] = Critere_MHW4D(x)
% Cette fonction d�finit le crit�re du probl�me MH4WD

fonc = (x(1)-1)^2 + (x(1)-x(2))^2 + ((x(2)-x(3))^3) + ((x(3)-x(4))^4) + ((x(4)-x(5))^4);
end