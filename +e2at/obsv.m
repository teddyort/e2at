function [ O ] = obsv(A,C)
%OBSV  Compute the observability matrix.
%
%   O = OBSV(A,B) Returns the observability matrix [C; CA; CA^2;...CA^(n-1)] 
%
%   O = OBSV(SYMSS) Returns the observability matrix for a symss object

if nargin==1
    [A,~,C]=A.abcd;
end
r = arrayfun(@(x)C*A^x,0:length(A)-1,'uniformoutput',false);
O = cat(1,r{:});

end