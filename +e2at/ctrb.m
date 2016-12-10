function [ Co ] = ctrb( A,B)
%CTRB  Compute the controllability matrix.
%
%   CO = CTRB(A,B) Returns the controllability matrix [B AB A^2B...A^(n-1)B] 
%
%   CO = CTRB(SYMSS) Returns the controllability matrix for a symss object

if nargin==1
    [A,B]=A.abcd;
end
r = arrayfun(@(x)A^x*B,0:length(A)-1,'uniformoutput',false);
Co = cat(2,r{:});

end