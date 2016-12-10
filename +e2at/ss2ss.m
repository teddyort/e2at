function [varargout] = ss2ss(A,B,C,D,T)
%SS2SS Transform a state-space system using matrix T
%
%   [At,Bt,Ct,Dt] = SS2SS(A,B,C,D,T) Transforms the system matrices A,B,C,D
%   using the transformation matrix T
%
%   SYMSSt = SS2SS(SYMSS, T) Transforms the symss object using the
%   transformation matrix T
% 
%   The state variables are transformed according to Xt=TX
%   Inputs may be symbolic

    if nargin==2
        T=B;
        [A,B,C,D]=A.abcd;
    end

    At = T*A/T;
    Bt = T*B;
    Ct = C/T;
    
    if nargin==2
        varargout = {e2at.symss(At,Bt,Ct,D)};
    else
        varargout = {At,Bt,Ct,D};
    end
    

end
