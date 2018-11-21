function [lambdaQP, dQP] = SolutionPbQuadratique(g,Q,A,b)
% Cette fonction permet de recuperer le couple (lambdaQP, dQP)  
% solution du problème quadratique note (QP) dans l' enonce

lambdaQP = -inv( (A*(Q\A')) )*(A*(Q\g) +b) ; 
dQP = -inv(Q)*(A'*lambdaQP +g) ;
end