function [ K ] = place_obsv( A, C, poles )
%PLACE_OBSV Calculates the gain K of a full state observer with the
%desired poles.
%   K = PLACE_OBSV(A,C,poles) Returns the gain K that would make the closed
%   loop system have the desired poles
%
%   K = PLACE_OBSV(symss, poles) is equivalent to: 
%           PLACE_OBSV(symss.A, symss.C, poles)
    if nargin==2
        poles = C;
        [A,~,C]=A.abcd;
    end

    K_transpose = e2at.place_ctrl(A', C', poles); 
    K = K_transpose';
end