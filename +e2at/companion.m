function [ varargout ] = companion( A,B,C,D )
%COMPANION Computes the companion form of a state space model in A,B,C,D
%
%   [Ac,Bc,Cc,Dc,P] = COMPANION(A,B,C,D) Returns the state matrices in
%   companion form, along with P, the variable transformation matrix where
%   Xc = Px
%
%   [SYMSSc,P] = COMPANION(symss) Converts the symss object into companion form
%   
%   Also returns P, the variable transformation matrix where Xc = Px
%   The state matrices can contain symbolic expressions

    if nargin==1
        [A,B,C,D]=A.abcd;
    end

    M = e2at.ctrb(A,B);
    Mi = inv(M);
    e = Mi(end,:);
    r = arrayfun(@(x)e*A^x,0:length(A)-1,'uniformoutput',false);
    P = cat(1,r{:});
    [Ac,Bc,Cc,Dc] = e2at.ss2ss(A,B,C,D,P);
    if nargin==1
        varargout = {e2at.symss(Ac,Bc,Cc,Dc)};
    else
        varargout = {Ac,Bc,Cc,Dc};
    end
end
