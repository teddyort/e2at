function [ tf ] = ss2tf(A,B,C,D )
%SS2TF Convert matrices A,B,C, and D to a transfer function.
%
%   TF = SS2TF(A,B,C,D) Returns a symbolic transfer function for the 
%   system with matrices A,B,C,D
%
%   TF = SS2TF(SYMSS) Retrurns a symbolic transfer function for the symss
%   object
%
%   The TF uses the symbol 's' to represent the laplace transform variable
%   Allows the system matrices to be symbolic

    if nargin==1
        [A,B,C,D]=A.abcd;
    end
    syms s;
    tf=collect(C*(s*eye(size(A))-A)^-1*B+D);
end
